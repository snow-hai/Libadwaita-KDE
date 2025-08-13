#!/usr/bin/bash

# THIS SCRIPT IS NOT MEANT TO BE RAN MANUALY!
# If you still want to do so. Understand the
# structure of acguments before running.

export theme_name="libadwaita-kde"
export theme_color="$1" # $1 gets checked later to ensure it works
export theme_variant="$2" # $2 gets checked later to ensure it works
export HIGHLIGHT_FILE="./base/base_highlight.svg"
export PANEL_FILE="./base/base_panel.svg"
export THEME_FILE="./base/base_theme.conf"
export FCITX5_CONFIG_DIR="$HOME/.local/share/fcitx5/themes/"
export BLURMASK="./base/blur-mask.svg"

export RPNAME="THEME_NAME_BASE_RN"
export RPAUTHOR="AUTHOR_NAME"
export AUTHOR="Saba Neko"

# base colors (these colors are used in base_highlight.svg, base_panel.svg, and base_theme.conf)
export base_text="#ffffff"
export base_menu="#ff00ff"
export base_highlight="#000000"

color_light() {
    export text="#323237"
    export menu="#ffffff"
    export highlight="#ebebeb"
    export THEME="light"
}
color_dark() {
    export text="#ffffff"
    export menu="#36363a"
    export highlight="#4a4a4e"
    export THEME="dark"
}

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

export build_dir="$theme_name-$theme_color-$theme_variant"
mkdir -p "./$build_dir"

export built_theme=$(sed \
    -e "s/$base_text/$text/" \
    -e "s/$RPAUTHOR/$AUTHOR/" \
    -e "s/$RPNAME/$theme_name-$THEME/" \
    "$THEME_FILE" \
    > "./$build_dir/theme.conf"
)
export built_panel=$(sed \
    -e "s/$base_menu/$menu/" \
    "$PANEL_FILE" \
    > "./$build_dir/panel.svg"
)
export built_highlight=$(sed \
    -e "s/$base_highlight/$highlight/" \
    "$HIGHLIGHT_FILE" \
    > "./$build_dir/highlight.svg"
)
cp -r "$BLURMASK" "$build_dir/"

if [ -z "$2" ]; then
    exit 0
else if [ "$2" == "--install" ]; then
    cp -r "./$build_dir/" "$FCITX5_CONFIG_DIR/"
    rm -r "./$build_dir/"
    exit 0
fi
fi