;;; color-changer --- theme
;;; Commentary:
;;; Code:

(load-file "~/.doom.d/themes/common/variables.el")

(setq colors-list '(("red" "dark red" "brown" "firebrick" "indian red" "light coral" "salmon" "light salmon" "tomato" "coral" "dark salmon" "rosy brown" "sienna" "saddle brown" "chocolate" "peru" "sandy brown" "burlywood" "tan" "navajo white" "wheat" "red4" "red3" "red2" "red1" "brown4" "brown3" "brown2" "brown1" "firebrick4" "firebrick3" "firebrick2" "firebrick1" "IndianRed4" "IndianRed3" "IndianRed2" "IndianRed1" "tomato4" "tomato3" "tomato2" "tomato1" "coral4" "coral3" "coral2" "coral1" "salmon4" "salmon3" "salmon2" "salmon1" "LightSalmon4" "LightSalmon3" "LightSalmon2" "LightSalmon1" "sienna4" "sienna3" "sienna2" "sienna1") ("orange" "orange red" "dark orange" "OrangeRed4" "OrangeRed3" "OrangeRed2" "OrangeRed1" "DarkOrange4" "DarkOrange3" "DarkOrange2" "DarkOrange1" "orange4" "orange3" "orange2" "orange1" "chocolate4" "chocolate3" "chocolate2" "chocolate1" "tan4" "tan3" "tan2" "tan1") ("yellow" "gold" "dark goldenrod" "goldenrod" "light goldenrod" "pale goldenrod" "cornsilk" "dark khaki" "khaki" "lemon chiffon" "gold4" "gold3" "gold2" "gold1" "yellow4" "yellow3" "yellow2" "yellow1" "DarkGoldenrod4" "DarkGoldenrod3" "DarkGoldenrod2" "DarkGoldenrod1" "goldenrod4" "goldenrod3" "goldenrod2" "goldenrod1" "cornsilk4" "cornsilk3" "cornsilk2" "cornsilk1" "LightGoldenrod4" "LightGoldenrod3" "LightGoldenrod2" "LightGoldenrod1" "LemonChiffon4" "LemonChiffon3" "LemonChiffon2" "LemonChiffon1" "khaki4" "khaki3" "khaki2" "khaki1" "LightYellow4" "LightYellow3" "LightYellow2" "LightYellow1" "ivory4" "ivory3" "ivory2" "ivory1") ("green" "chartreuse" "lawn green" "spring green" "medium spring green" "dark olive green" "olive drab" "yellow green" "green yellow" "light green" "forest green" "dark green" "lime green" "pale green" "dark sea green" "sea green" "medium sea green" "chartreuse4" "chartreuse3" "chartreuse2" "chartreuse1" "green4" "green3" "green2" "green1" "SpringGreen4" "SpringGreen3" "SpringGreen2" "SpringGreen1" "OliveDrab4" "OliveDrab3" "OliveDrab2" "OliveDrab1" "DarkOliveGreen4" "DarkOliveGreen3" "DarkOliveGreen2" "DarkOliveGreen1" "PaleGreen4" "PaleGreen3" "PaleGreen2" "PaleGreen1" "DarkSeaGreen4" "DarkSeaGreen3" "DarkSeaGreen2" "DarkSeaGreen1" "honeydew4" "honeydew3" "honeydew2" "honeydew1" "SeaGreen4" "SeaGreen3" "SeaGreen2" "SeaGreen1") ("blue" "cyan" "deep sky blue" "medium blue" "light sea green" "medium aquamarine" "aquamarine" "dark cyan" "dark turquoise" "medium turquoise" "turquoise" "pale turquoise" "powder blue" "light blue" "sky blue" "light sky blue" "cadet blue" "steel blue" "dark slate gray" "slate gray" "light slate gray" "royal blue" "dodger blue" "cornflower blue" "light steel blue" "dark blue" "navy" "midnight blue" "cyan4" "cyan3" "cyan2" "cyan1" "turquoise4" "turquoise3" "turquoise2" "turquoise1" "DeepSkyBlue4" "DeepSkyBlue3" "DeepSkyBlue2" "DeepSkyBlue1" "blue4" "blue3" "blue2" "blue1" "aquamarine4" "aquamarine3" "aquamarine2" "aquamarine1" "DarkSlateGray4" "DarkSlateGray3" "DarkSlateGray2" "DarkSlateGray1" "PaleTurquoise4" "PaleTurquoise3" "PaleTurquoise2" "PaleTurquoise1" "LightCyan4" "LightCyan3" "LightCyan2" "LightCyan1" "azure4" "azure3" "azure2" "azure1" "CadetBlue4" "CadetBlue3" "CadetBlue2" "CadetBlue1" "LightBlue4" "LightBlue3" "LightBlue2" "LightBlue1" "LightSkyBlue4" "LightSkyBlue3" "LightSkyBlue2" "LightSkyBlue1" "SkyBlue4" "SkyBlue3" "SkyBlue2" "SkyBlue1" "SteelBlue4" "SteelBlue3" "SteelBlue2" "SteelBlue1" "DodgerBlue4" "DodgerBlue3" "DodgerBlue2" "DodgerBlue1" "SlateGray4" "SlateGray3" "SlateGray2" "SlateGray1" "LightSteelBlue4" "LightSteelBlue3" "LightSteelBlue2" "LightSteelBlue1" "RoyalBlue4" "RoyalBlue3" "RoyalBlue2" "RoyalBlue1" "SlateBlue4" "SlateBlue3" "SlateBlue2" "SlateBlue1") ("magenta" "dark violet" "dark magenta" "dark slate blue" "slate blue" "medium slate blue" "light slate blue" "medium purple" "blue violet" "purple" "dark orchid" "medium orchid" "orchid" "thistle" "plum" "violet" "medium violet red" "violet red" "pale violet red" "maroon" "deep pink" "hot pink" "pink" "light pink" "magenta4" "magenta3" "magenta2" "magenta1" "RosyBrown4" "RosyBrown3" "RosyBrown2" "RosyBrown1" "MediumPurple4" "MediumPurple3" "MediumPurple2" "MediumPurple1" "purple4" "purple3" "purple2" "purple1" "DarkOrchid4" "DarkOrchid3" "DarkOrchid2" "DarkOrchid1" "MediumOrchid4" "MediumOrchid3" "MediumOrchid2" "MediumOrchid1" "thistle4" "thistle3" "thistle2" "thistle1" "plum4" "plum3" "plum2" "plum1" "orchid4" "orchid3" "orchid2" "orchid1" "maroon4" "maroon3" "maroon2" "maroon1" "DeepPink4" "DeepPink3" "DeepPink2" "DeepPink1" "HotPink4" "HotPink3" "HotPink2" "HotPink1" "VioletRed4" "VioletRed3" "VioletRed2" "VioletRed1" "LavenderBlush4" "LavenderBlush3" "LavenderBlush2" "LavenderBlush1" "PaleVioletRed4" "PaleVioletRed3" "PaleVioletRed2" "PaleVioletRed1" "pink4" "pink3" "pink2" "pink1" "LightPink4" "LightPink3" "LightPink2" "LightPink1") ("snow" "misty rose" "seashell" "peach puff" "linen" "antique white" "bisque" "papaya whip" "moccasin" "blanched almond" "old lace" "floral white" "beige" "light yellow" "light goldenrod yellow" "ivory" "honeydew" "mint cream" "light cyan" "azure" "alice blue" "lavender" "ghost white" "lavender blush" "snow4" "snow3" "snow2" "snow1" "MistyRose4" "MistyRose3" "MistyRose2" "MistyRose1" "seashell4" "seashell3" "seashell2" "seashell1" "PeachPuff4" "PeachPuff3" "PeachPuff2" "PeachPuff1" "bisque4" "bisque3" "bisque2" "bisque1" "AntiqueWhite4" "AntiqueWhite3" "AntiqueWhite2" "AntiqueWhite1" "burlywood4" "burlywood3" "burlywood2" "burlywood1" "NavajoWhite4" "NavajoWhite3" "NavajoWhite2" "NavajoWhite1" "wheat4" "wheat3" "wheat2" "wheat1")))
(setq color-background "white")              ;
(setq color-background-low "white")          ;
(setq color-background-lower "white")        ;
(setq color-background-lowest "white")       ;
(setq color-background-saturated "white")    ;
(setq color-constant "black")                ;constant
(setq color-function "black")                ;function
(setq color-highlight-1 "black")             ;highlight-1
(setq color-keyword "black")                 ;keyword
(setq color-low "black")                     ;low
(setq color-lower "black")                   ;lower
(setq color-preprocessor "black")            ;preprocessor
(setq color-text "black")                    ;text
(setq color-type "black")                    ;type 
(setq color-variable "black")                ;variable

(defun my:lightness (r g b)
  "Calculate the lightness of a color given its RGB values in the range [0.0, 1.0]."
  (let* ((luminance (+ (* 0.2126 r) (* 0.7152 g) (* 0.0722 b))))
    luminance))

(defun my:get-hue (r g b)
  "Calculate the hue of an RGB color."
  (let* ((hsl-values (color-rgb-to-hsl r g b))
         (hue (car hsl-values)))
    hue))

(defun my:get-saturation (r g b)
  "Calculate the saturation of an RGB color."
  (let* ((hsl-values (color-rgb-to-hsl r g b))
         (saturation (cadr hsl-values)))
    saturation))

(defun my:get-lightness (r g b)
  "Calculate the lightness of an RGB color."
  (let* ((hsl-values (color-rgb-to-hsl r g b))
         (lightness (caddr hsl-values)))
    lightness))

(defun my:adjust-lightness (r g b factor)
  "Adjust the lightness of a color by multiplying each RGB component by a factor."
  (let* ((adjusted-r (* r factor))
         (adjusted-g (* g factor))
         (adjusted-b (* b factor)))
    (color-rgb-to-hex adjusted-r adjusted-g adjusted-b)))

(defun my:get-random-element (list-of-lists)
  "Get a random element from a list of lists."
  (let* ((random-sublist (nth (random (length list-of-lists)) list-of-lists))
         (random-index (random (length random-sublist))))
    (setq color-type (elt random-sublist 0))
    (elt random-sublist random-index)))

(message "Color data")
(setq random-color-name (my:get-random-element colors-list))
;(setq random-color-name "white")
(message "random color name: %s" random-color-name) 
(setq random-color-rgb (color-name-to-rgb random-color-name))
(message "rgb %s" (prin1-to-string random-color-rgb))
(message "r %s" (prin1-to-string (car random-color-rgb)))
(message "g %s" (prin1-to-string (cadr random-color-rgb)))
(message "b %s" (prin1-to-string (caddr random-color-rgb)))
(message "lightness: %s" (prin1-to-string (my:lightness (car random-color-rgb) (cadr random-color-rgb) (caddr random-color-rgb))))
(setq adjusted-color (my:adjust-lightness 1.0 1.0 1.0 0.5))
(message "Adjusted color: %s" adjusted-color)
(message "Saturation: %s" (prin1-to-string (my:get-saturation 1.0 0.0 0.0)))

;The HSL (Hue, Saturation, Lightness) color model represents colors in terms of three components:
;Hue (H): This is the type of color, represented as an angle on a color wheel. It ranges from 0 to 1, with 0 and 1 both representing red, 1/6 representing yellow, 2/6 representing green, and so on.
;Saturation (S): This represents the vividness or intensity of the color. A saturation of 0.0 means a completely desaturated color (grayscale), while 1.0 means fully saturated (vivid) color.
;Lightness (L): This represents the brightness or darkness of the color. A lightness of 0.0 is black, 0.5 is a balanced color, and 1.0 is white.
;The color-rgb-to-hsl function in Emacs Lisp takes RGB values and converts them to HSL values. The result is a list with three elements corresponding to the Hue, Saturation, and Lightness components.

;https://www.gnu.org/software/emacs/manual/html_node/emacs/Colors.html#RGB-Triplets

(defun my:background-color ()
  (let* (;get random background color
         (background-color-name (my:get-random-element colors-list))
         ;convert background color to rgb
         (background-color-rgb (color-name-to-rgb background-color-name))
         ;get the hue from the r g b values
         (background-color-hue (prin1-to-string
                                (my:get-hue (car background-color-rgb)
                                            (cadr background-color-rgb)
                                            (caddr background-color-rgb))))
         ;get the saturation from the r g b values
         (background-color-saturation (prin1-to-string
                                       (my:get-saturation (car background-color-rgb)
                                                          (cadr background-color-rgb)
                                                          (caddr background-color-rgb))))
         ;get the lightness from the r g b values
         (background-color-lightness (prin1-to-string
                                      (my:get-lightness (car background-color-rgb)
                                                        (cadr background-color-rgb)
                                                        (caddr background-color-rgb))))
         (message "-------------------------------------------------------")
         (message "my:background-color")
         (message "...................")
         (message "name:\t\t%s " background-color-name)
         ;;(message "hue:\t\t%s (0/1 red | 1/6 yellow | 2/6 green | 3/6 cyan | 4/6 blue | 5/6 magenta)" background-color-hue)
         ;;(message "saturation:\t%s " background-color-saturation)
         ;;(message "lightness:\t%s " background-color-lightness)
                                        ;TODO
                                        ;(message "lightness2:\t%s " background-color-lightness2)
                                        ;(if (eq INDEX-CHIAROSCURO INDEX-COLOR-CHANGE-DARK)
                                        ;    (progn (message "theme:\t\tdark"))
                                        ;  (progn (message "theme:\t\tlight")))
         (message "-------------------------------------------------------")
         ))
                                        ;(setq color-background background-color-name))
  )  

(defun my:text-color ()
  (setq color-text (color-complement-hex color-background))
  (setq color-background (color-desaturate-name color-background 60)))

(defun my:other-background-colors ()
  (setq color-background-low (color-darken-name color-background 20))
  (setq color-background-lower (color-darken-name color-background 21))
  (setq color-background-lowest (color-darken-name color-background 22))
  (setq color-background-saturated (color-saturate-name color-background 100)))

(defun my:complementary-text-colors ())
(defun my:font-lock-colors ())
(defun my:print-colors ())

(defun my:print-log ()
  (message "Color type: %s" color-type)
  (message "Color background: %s" color-background))

;;(my:background-color)
;;(my:other-background-colors)
;;(my:text-color)
;;(my:complementary-text-colors)
;;(my:font-lock-colors)
;;(my:print-colors)
;;(my:print-log)

(setq background color-background)
(setq background-fringe color-background-low)
(setq background-hl color-background-low)
(setq background-magit color-background-lower)
(setq background-magit-dark color-background-lowest)
(setq background-mode-line color-background-low)
(setq background-mode-line-active color-background-low)
(setq background-region color-background-low)

(setq text-constant "#000000")
(setq text-error "#000000")
(setq text-function "#000000")
(setq text-highlight-1 "#000000")
(setq text-highlight-2 "#000000")
(setq text-keyword "#000000")
(setq text-low "#000000")
(setq text-lower "#000000")
(setq text-normal color-text)
(setq text-preprocessor "#000000")
(setq text-type "#000000")
(setq text-variable "#000000")
(setq text-warning "#000000")

;;; color-changer.el ends here
