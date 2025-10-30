# Libadwaita KDE 

A attempt at porting the Libadwaita look to KDE/Qt. <br>
This is a work in progress, install scripts, and further things will be added in the future.

---

**Repositories:** [GitLab](https://gitlab.com/wawahai/Libadwaita-KDE) [GitHub](https://github.com/wawahaii/Libadwaita-KDE). These repositories are automaticaly mirrored. However if you want to contribute please do so on the GitLab.


---

## To Do
- [x] KColorSchemes
- [x] Aurorae
- [x] Kvantum theme 
- [ ] Plasma Style (needs corrections in looks)
- [x] Fcitx5 Theme

---

### General Notes
- The themes are made with the intent of looking like libadwaita, while also containing a little bit more color.
- The themes are made with the intent that you adjust them to your prefference 

## KColorSchemes
<p>
<img src="Assets/kcolor-light.png" alt="Light ColorScheme">
<img src="Assets/kcolor-dark.png" alt="Dark ColorScheme">
</p>

### Main colour support
- [x] Dark
- [x] Light
### Accent colour support
- [x] Default (Blue)
- [x] Teal
- [x] Green
- [x] Yellow
- [x] Orange
- [x] Red
- [x] Pink
- [x] Purple
- [x] Grey

**Notes:** ``./build.sh [light | dark] [accent] [--install (optional)]`

---

## Aurorae
<p>
<img src="Assets/aurorae-light.png" alt="Light Aurorae">
<img src="Assets/aurorae-dark.png" alt="Dark Aurorae"> 
</p>

Based on [Colloid aurorae theme](https://www.pling.com/p/1738680/) and [Nova](https://www.pling.com/p/1662814/)

### Main colour support
- [x] Light
- [x] Dark
### Button Support
- [x] Close
- [x] Show on all desktops
### Recomended Settings
- Button Size: Tiny

### Rounded Corners
I recomend using [KDE-Rounded-Corners](https://github.com/matinlotfali/KDE-Rounded-Corners) to get all window corners to be round, this will make the theme look more accurate to libadwaita. **Note:** you cant use the custom aurorae with this, its a tradeoff between button accuracy and rounding accuracy.

---

## Kvantum
<p>
<img src="Assets/kvan-light.png" alt="Light Kvantum"> 
<img src="Assets/kvan-dark.png" alt="Dark Kvantum"> 
</p>

Based on [Orchis Kvantum](https://www.pling.com/p/1458909/) 

### Main colour support
- [x] Light
- [x] Dark
### Accent colour support
- [x] Default (Blue)
- [x] Teal
- [x] Green
- [x] Yellow
- [x] Orange
- [x] Red
- [x] Pink
- [x] Purple
- [x] Grey

**Notes:** `./build.sh [light | dark] [accent] [--install (optional)]`

---

## Plasma Style
Based on [Nova](https://www.pling.com/p/1659120/) and [Colloid](https://www.pling.com/p/1738718/)
I didnt do much on this except swap out a few files.

### Main colour support
- [x] Automatic

### Accent colour support
- [x] Automatic

**Notes:** Panel needs to be made black to fit with the GNOME panel.

## Fcitx5 Theme
<p>
  <img src="Assets/fcitx5-dark.png" alt="Dark Fcitx5 Theme">
  <img src="Assets/fcitx5-light.png" alt="Light Fcitx5 Theme">
</p>
Based on [fcitx5-mellow-themes](https://github.com/sanweiya/fcitx5-mellow-themes)
 
### Main colorour support
- [x] Light
- [x] Dark

**Notes:** `./build.sh [light | dark] [--install (optional)]`
