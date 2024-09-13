(TeX-add-style-hook
 "toric"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("revtex4-2" "aps" "prb" "12pt" "tightenlines" "notitlepage")))
   (TeX-run-style-hooks
    "latex2e"
    "revtex4-2"
    "revtex4-212"
    "pstricks"
    "pst-solides3d"))
 :latex)

