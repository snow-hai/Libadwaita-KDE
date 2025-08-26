#!/usr/bin/bash

# THIS SCRIPT IS NOT MEANT TO BE RAN MANUALY!
# If you still want to do so. Understand the
# structure of acguments before running.

export theme_name="libadwaita-kde"
export theme_color="$1" # $1 gets checked later to ensure it works
export theme_variant="$2" # $2 gets checked later to ensure it works
export SVG_FILE="./base/base.svg"
export KVCONF_FILE="./base/base.kvconfig"
export KVCONFIG_DIR="$HOME/.config/Kvantum/"

# base colors (these colors are used in base.svg and base.kvconfig)
export base_text="#ffffff"
export base_window="#ff0000"
export base_view="#00ff00"
export base_header="#00ffff"
export base_header_separator="#00abb6"
export base_menu="#ff00ff"
export base_tooltip="#ffff00"
export base_tooltip_text="#ffff80"
export base_accent="#3584e4"
export base_accent_hover="#599cea"
export base_accent_text="#75aee4"
export base_disabled_text="#000000"

color_light() {
    export text="#323237"
    export window="#fafafb"
    export view="#ffffff"
    export header="#ffffff"
    export header_separator="#e7e7ee"
    export menu="#ffffff"
    export tooltip="#323237"
    export tooltip_text="#ffffff"
    export accent_text="#ffffff"
    export disabled_text="#62626c"
}
color_dark() {
    export text="#ffffff"
    export window="#222226"
    export view="#1d1d20"
    export header="#2e2e32"
    export header_separator="#242424"
    export menu="#36363a"
    export tooltip="#323237"
    export tooltip_text="#ffffff"
    export accent_text="#ffffff"
    export disabled_text="#868691"
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
        accent="#3584e4"
        accent_hover="#55a4f4"
        ;;
    teal)
        accent="#2190a4"
        accent_hover="#41b0c4"
        ;;
    green)
        accent="#3a944a"
        accent_hover="#5aa46a"
        ;;
    yellow)
        accent="#c88800"
        accent_hover="#e8a820"
        ;;
    orange)
        accent="#ed5b00"
        accent_hover="#fd7b20"
        ;;
    red)
        accent="#e62d42"
        accent_hover="#f64d62"
        ;;
    pink)
        accent="#d56199"
        accent_hover="#f581b9"
        ;;
    purple)
        accent="#9141ac"
        accent_hover="#b161cc"
        ;;
    slate)
        accent="#6f8396"
        accent_hover="#8fa3b6"
        ;;
    *)
        echo "no or unknown accent provided"
        exit 1
esac

export build_dir="$theme_name-$theme_color-$theme_variant"
mkdir -p "./$build_dir"

export built_svg=$(sed \
    -e "s/$base_text/$text/" \
    -e "s/$base_window/$window/" \
    -e "s/$base_view/$view/" \
    -e "s/$base_header/$header/" \
    -e "s/$base_header_separator/$header_separator/" \
    -e "s/$base_menu/$menu/" \
    -e "s/$base_tooltip/$tooltip/" \
    -e "s/$base_accent/$accent/" \
    -e "s/$base_accent_hover/$accent_hover/" \
    "$SVG_FILE" \
    > "./$build_dir/$build_dir.svg"
)
export built_kvconf=$(sed \
    -e "s/$base_text/$text/" \
    -e "s/$base_window/$window/" \
    -e "s/$base_view/$view/" \
    -e "s/$base_header/$header/" \
    -e "s/$base_header_separator/$header_separator/" \
    -e "s/$base_menu/$menu/" \
    -e "s/$base_tooltip/$tooltip/" \
    -e "s/$base_tooltip_text/$tooltip_text/" \
    -e "s/$base_accent/$accent/" \
    -e "s/$base_accent_hover/$accent_hover/" \
    -e "s/$base_accent_text/$accent_text/" \
    -e "s/$base_disabled_text/$disabled_text/" \
    "$KVCONF_FILE" \
    > "./$build_dir/$build_dir.kvconfig"
)

if [ -z "$3" ]; then
    exit 0
elif [ "$3" == "--install" ]; then
    cp -r "./$build_dir/" "$KVCONFIG_DIR/"
    rm -r "./$build_dir/"
    exit 0
fi