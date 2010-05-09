*** freetype1/ftlow.ml.orig	Sun Nov 20 23:03:16 2005
--- freetype1/ftlow.ml	Sun Nov 20 23:04:03 2005
***************
*** 213,220 ****
  
  let get_charmap_ids face =
    let charmaps = ref [] in
    let n = get_charmap_count face in
    for i = 0 to n - 1 do
!     charmaps := (i, get_charmap_id face i) : : !charmaps
    done;
    List.rev !charmaps;;
--- 213,220 ----
  
  let get_charmap_ids face =
    let charmaps = ref [] in
    let n = get_charmap_count face in
    for i = 0 to n - 1 do
!     charmaps := (i, get_charmap_id face i) :: !charmaps
    done;
    List.rev !charmaps;;
