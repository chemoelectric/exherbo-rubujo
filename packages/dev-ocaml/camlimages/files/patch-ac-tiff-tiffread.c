--- tiff/tiffread.c.orig	2004-09-21 23:56:44.000000000 +0200
+++ tiff/tiffread.c	2009-12-18 17:03:10.000000000 +0100
@@ -17,6 +17,16 @@
 #include <caml/alloc.h>
 #include <caml/memory.h>
 #include <caml/fail.h>
+#include <limits.h>
+
+/* Test if x or y are negative, or if multiplying x * y would cause an
+ * arithmetic overflow.
+ */
+#define oversized(x, y)                                                \
+  ((x) < 0 || (y) < 0 || ((y) != 0 && (x) > INT_MAX / (y)))
+
+#define failwith_oversized(lib) \
+  failwith("#lib error: image contains oversized or bogus width and height");
 
 #if HAVE_TIFF
 
@@ -28,11 +38,6 @@
 
 #include <tiffio.h>
 
-#undef int16
-#undef uint16
-#undef int32
-#undef uint32
-
 extern value *imglib_error;
 
 value open_tiff_file_for_read( name )
@@ -68,6 +73,10 @@
     TIFFGetField(tif, TIFFTAG_YRESOLUTION, &yres);
     TIFFGetField(tif, TIFFTAG_PHOTOMETRIC, &photometric);
 
+    if (oversized (imagewidth, imagelength)) {
+      failwith_oversized("tiff");
+    }
+
     if( imagesample == 3 && photometric == PHOTOMETRIC_RGB ){
       if( imagebits != 8 ){
 	failwith("Sorry, tiff rgb file must be 24bit-color");
