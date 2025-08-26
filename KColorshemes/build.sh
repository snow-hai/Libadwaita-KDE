#!/usr/bin/bash

# THIS SCRIPT IS NOT MEANT TO BE RAN MANUALY!
# If you still want to do so. Understand the
# structure of acguments before running.

export theme_name="libadwaita-kde"
export theme_color="$1" # $1 gets checked later to ensure it works
export theme_variant="$2" # $2 gets checked later to ensure it works
export BASE_FILE="./base/base.colors"
export COLOR_DIR="$HOME/.local/share/color-schemes/"
export RPNAME="THEME_NAME_VARIANT"

# base colors (these colors are used in base.colors)
export base_text="255,255,255" # #ffffff
export base_window="255,0,0" # #ff0000
export base_view="0,255,0" # #00ff00
export base_button="128,255,0" #80ff00
export base_header="0,255,255" # #00ffff
export base_tooltip="255,255,0" # #ffff00
export base_tooltip_text="255,255,128" # #ffff80
export base_accent="0,0,255" # #0000ff
export base_accent_text="128,128,255" # #8080ff
export base_disabled_text="0,0,0" # #000000
export base_visited="102,68,51" # #664433
export base_error="248,52,121" # #f83479
export base_neutral="116,80,105" # #745069
export base_positive="15,143,136" # #0f8f88
export base_hover="250,251,0" # #fafb00

color_light() {
    export text="50,50,55" # #323237
    export window="250,250,251" # #fafafb
    export view="255,255,255" # #ffffff
    export button="237,237,238" # #ededee
    export header="255,255,255" # #ffffff
    export tooltip="50,50,55" # #323237
    export tooltip_text="255,255,255" # #ffffff
    export accent_text="255,255,255" # #ffffff
    export disabled_text="98,98,108" # #62626c
    export visited="145,65,172" # #9141ac
    export error="230,45,66" # #e62d42
    export neutral="200,136,0" # #c88800
    export positive="58,148,74" # #3a944a
    export hover="237,237,238" # #ededee
}
color_dark() {
    export text="255,255,255" # #ffffff
    export window="34,34,38" # #222226
    export view="29,29,32" # #1d1d20
    export button="53,53,59" # #35353b
    export header="46,46,50" # #2e2e32
    export tooltip="50,50,55" # #323237
    export tooltip_text="255,255,255" # #ffffff
    export accent_text="255,255,255" # #ffffff
    export disabled_text="134,134,145" # #868691
    export visited="145,65,172" # #9141ac
    export error="230,45,66" # #e62d42
    export neutral="200,136,0" # #c88800
    export positive="58,148,74" # #3a944a
    export hover="53,53,59" # #35353b
}

export accent
export accent_hover

case $1 in
    dark)
        color_dark
        ;;
    light)
        color_light
        ;;
    *)
        echo "Didnt set color arg/wrong colorscheme"
        exit 1
esac

case $2 in
    blue)
        accent="53,132,228" # #3584e4
        ;;
    teal)
        accent="33,144,164" # #2190a4
        ;;
    green)
        accent="58,148,74" # #3a944a
        ;;
    yellow)
        accent="200,136,0" # #c88800
        ;;
    orange)
        accent="237,91,0" # #ed5b00
        ;;
    red)
        accent="230,45,66" # #e62d42
        ;;
    pink)
        accent="213,97,153" # #d56199
        ;;
    purple)
        accent="145,65,172" # #9141ac
        ;;
    slate)
        accent="111,131,150" # #6f8396
        ;;
    *)
        echo "no or unknown accent provided"
        exit 1
esac

export build_dir="$theme_name-$theme_color-$theme_variant"
mkdir -p "./$build_dir"

export built_colors=$(sed \
    -e "s/$base_text/$text/" \
    -e "s/$base_window/$window/" \
    -e "s/$base_view/$view/" \
    -e "s/$base_button/$button/" \
    -e "s/$base_header/$header/" \
    -e "s/$base_tooltip/$tooltip/" \
    -e "s/$base_tooltip_text/$tooltip_text/" \
    -e "s/$base_accent/$accent/" \
    -e "s/$base_accent_text/$accent_text/" \
    -e "s/$base_disabled_text/$disabled_text/" \
    -e "s/$base_visited/$visited/" \
    -e "s/$base_error/$error/" \
    -e "s/$base_neutral/$neutral/" \
    -e "s/$base_positive/$positive/" \
    -e "s/$base_hover/$hover/" \
    -e "s/$RPNAME/$build_dir/" \
    "$BASE_FILE" \
    > "./$build_dir/$build_dir.colors"
)

if [ -z "$3" ]; then
    exit 0
elif [ "$3" == "--install" ]; then
    cp -r "./$build_dir/$build_dir.colors" "$COLOR_DIR/"
    rm -r "./$build_dir/"
    exit 0
fi