*** freetype1/freetype.ml.orig	Sun Nov 20 23:14:38 2005
--- freetype1/freetype.ml	Sun Nov 20 23:14:57 2005
***************
*** 296,306 ****
      let oc = Ftlow.get_outline_contents outline.cont in
      { n_contours= oc.Ftlow.n_contours;
        n_points = oc.Ftlow.n_points;
        points =
          Array.map
!           (fun x, y ->
               float_of_intfrac6 x, float_of_intfrac6 y)
            oc.Ftlow.points;
        tags = oc.Ftlow.tags;
        contours = oc.Ftlow.contours; };;
  
--- 296,306 ----
      let oc = Ftlow.get_outline_contents outline.cont in
      { n_contours= oc.Ftlow.n_contours;
        n_points = oc.Ftlow.n_points;
        points =
          Array.map
!           (fun (x,y) ->
               float_of_intfrac6 x, float_of_intfrac6 y)
            oc.Ftlow.points;
        tags = oc.Ftlow.tags;
        contours = oc.Ftlow.contours; };;
  
