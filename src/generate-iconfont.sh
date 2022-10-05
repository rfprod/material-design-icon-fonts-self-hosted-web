#!/bin/bash

# regular
MATERIAL_ICONS_REGULAR_TTF_REMOTE="https://github.com/google/material-design-icons/blob/master/font/MaterialIcons-Regular.ttf?raw=true"
MATERIAL_ICONS_REGULAR_TTF_LOCAL_SRC="./src/MaterialIcons-Regular.ttf"
MATERIAL_ICONS_REGULAR_WOFF2_DIST="./iconfont/MaterialIcons-Regular.woff2"
# outlined regular
MATERIAL_ICONS_OUTLINED_REGULAR_OTF_REMOTE="https://github.com/google/material-design-icons/blob/master/font/MaterialIconsOutlined-Regular.otf?raw=true"
MATERIAL_ICONS_OUTLINED_REGULAR_OTF_LOCAL_SRC="./src/MaterialIconsOutlined-Regular.otf"
MATERIAL_ICONS_OUTLINED_REGULAR_EOT_LOCAL_SRC="./src/MaterialIconsOutlined-Regular.eot"
MATERIAL_ICONS_OUTLINED_REGULAR_TTF_LOCAL_SRC="./src/MaterialIconsOutlined-Regular.ttf"
MATERIAL_ICONS_OUTLINED_REGULAR_WOFF2_DIST="./iconfont/MaterialIconsOutlined-Regular.woff2"
# round regular
MATERIAL_ICONS_ROUND_REGULAR_OTF_REMOTE="https://github.com/google/material-design-icons/blob/master/font/MaterialIconsRound-Regular.otf?raw=true"
MATERIAL_ICONS_ROUND_REGULAR_OTF_LOCAL_SRC="./src/MaterialIconsRound-Regular.otf"
MATERIAL_ICONS_ROUND_REGULAR_EOT_LOCAL_SRC="./src/MaterialIconsRound-Regular.eot"
MATERIAL_ICONS_ROUND_REGULAR_TTF_LOCAL_SRC="./src/MaterialIconsRound-Regular.ttf"
MATERIAL_ICONS_ROUND_REGULAR_WOFF2_DIST="./iconfont/MaterialIconsRound-Regular.woff2"
# sharp regular
MATERIAL_ICONS_SHARP_REGULAR_OTF_REMOTE="https://github.com/google/material-design-icons/blob/master/font/MaterialIconsSharp-Regular.otf?raw=true"
MATERIAL_ICONS_SHARP_REGULAR_OTF_LOCAL_SRC="./src/MaterialIconsSharp-Regular.otf"
MATERIAL_ICONS_SHARP_REGULAR_EOT_LOCAL_SRC="./src/MaterialIconsSharp-Regular.eot"
MATERIAL_ICONS_SHARP_REGULAR_TTF_LOCAL_SRC="./src/MaterialIconsSharp-Regular.ttf"
MATERIAL_ICONS_SHARP_REGULAR_WOFF2_DIST="./iconfont/MaterialIconsSharp-Regular.woff2"
# two tone regular
MATERIAL_ICONS_TWOTONE_REGULAR_OTF_REMOTE="https://github.com/google/material-design-icons/blob/master/font/MaterialIconsTwoTone-Regular.otf?raw=true"
MATERIAL_ICONS_TWOTONE_REGULAR_OTF_LOCAL_SRC="./src/MaterialIconsTwoTone-Regular.otf"
MATERIAL_ICONS_TWOTONE_REGULAR_EOT_LOCAL_SRC="./src/MaterialIconsTwoTone-Regular.eot"
MATERIAL_ICONS_TWOTONE_REGULAR_TTF_LOCAL_SRC="./src/MaterialIconsTwoTone-Regular.ttf"
MATERIAL_ICONS_TWOTONE_REGULAR_WOFF2_DIST="./iconfont/MaterialIconsTwoTone-Regular.woff2"

##
# Checks if a deb package is installed.
##
checkIfDebPackageIsInstalled() {
  local PACKAGE_EXISTS
  PACKAGE_EXISTS=$(dpkg -s "$1")
  echo "${PACKAGE_EXISTS}"
}

##
# Installs packages:
# - eot-utils (https://manpages.debian.org/stretch/eot-utils/)
# - eot2ttf (https://packages.debian.org/stretch/fonts/eot2ttf)
# - woff2 (https://packages.debian.org/buster/woff2)
# - wget (https://www.gnu.org/software/wget/)
##
installTools() {
  # sudo apt install -y woff2 eot-utils wget

  local WOFF2_EXISTS
  WOFF2_EXISTS=$(checkIfDebPackageIsInstalled woff2)
  if [ -z "${WOFF2_EXISTS}" ]; then
    echo "woff2 is not installed. Installing the package..."

    sudo apt install -y woff2
  else
    echo "woff2 is already installed."
  fi

  local EOT_UTILS_EXISTS
  EOT_UTILS_EXISTS=$(checkIfDebPackageIsInstalled eot-utils)
  if [ -z "${EOT_UTILS_EXISTS}" ]; then
    echo "eot-utils is not installed. Installing the package..."

    sudo apt install -y eot-utils
  else
    echo "eot-utils is already installed."
  fi

  local WGET_EXISTS
  WGET_EXISTS=$(checkIfDebPackageIsInstalled wget)
  if [ -z "${WGET_EXISTS}" ]; then
    echo "wget is not installed. Installing the package..."

    sudo apt install -y wget
  else
    echo "wget is already installed."
  fi
}

##
# Cleans up downloaded source fonts located in the src directory.
##
cleanupSourceAndDistFonts() {
  rm -rf ./src/*.ttf ./src/*.otf ./src/*.eot ./src/*.woff*
  rm -rf ./iconfont/*.ttf ./iconfont/*.otf ./iconfont/*.eot ./iconfont/*.woff*
}

##
# Download source fonts from Google repo.
##
downloadSourceFonts() {
  wget -O "$MATERIAL_ICONS_REGULAR_TTF_LOCAL_SRC" "$MATERIAL_ICONS_REGULAR_TTF_REMOTE"
  wget -O "$MATERIAL_ICONS_OUTLINED_REGULAR_OTF_LOCAL_SRC" "$MATERIAL_ICONS_OUTLINED_REGULAR_OTF_REMOTE"
  wget -O "$MATERIAL_ICONS_ROUND_REGULAR_OTF_LOCAL_SRC" "$MATERIAL_ICONS_ROUND_REGULAR_OTF_REMOTE"
  wget -O "$MATERIAL_ICONS_SHARP_REGULAR_OTF_LOCAL_SRC" "$MATERIAL_ICONS_SHARP_REGULAR_OTF_REMOTE"
  wget -O "$MATERIAL_ICONS_TWOTONE_REGULAR_OTF_LOCAL_SRC" "$MATERIAL_ICONS_TWOTONE_REGULAR_OTF_REMOTE"
}

##
# Converts source fonts to woff2.
# Copies source source ttf fonts to the ./iconfont directory.
##
createFontsDist() {
  # regular
  woff2_compress ${MATERIAL_ICONS_REGULAR_TTF_LOCAL_SRC} >${MATERIAL_ICONS_REGULAR_WOFF2_DIST}
  # outlined regular
  mkeot ${MATERIAL_ICONS_OUTLINED_REGULAR_OTF_LOCAL_SRC} >${MATERIAL_ICONS_OUTLINED_REGULAR_EOT_LOCAL_SRC}
  eot2ttf ${MATERIAL_ICONS_OUTLINED_REGULAR_EOT_LOCAL_SRC} ${MATERIAL_ICONS_OUTLINED_REGULAR_TTF_LOCAL_SRC}
  woff2_compress ${MATERIAL_ICONS_OUTLINED_REGULAR_TTF_LOCAL_SRC} >${MATERIAL_ICONS_OUTLINED_REGULAR_WOFF2_DIST}
  # round regular
  mkeot ${MATERIAL_ICONS_ROUND_REGULAR_OTF_LOCAL_SRC} >${MATERIAL_ICONS_ROUND_REGULAR_EOT_LOCAL_SRC}
  eot2ttf ${MATERIAL_ICONS_ROUND_REGULAR_EOT_LOCAL_SRC} ${MATERIAL_ICONS_ROUND_REGULAR_TTF_LOCAL_SRC}
  woff2_compress ${MATERIAL_ICONS_ROUND_REGULAR_TTF_LOCAL_SRC} >${MATERIAL_ICONS_ROUND_REGULAR_WOFF2_DIST}
  # sharp regular
  mkeot ${MATERIAL_ICONS_SHARP_REGULAR_OTF_LOCAL_SRC} >${MATERIAL_ICONS_SHARP_REGULAR_EOT_LOCAL_SRC}
  eot2ttf ${MATERIAL_ICONS_SHARP_REGULAR_EOT_LOCAL_SRC} ${MATERIAL_ICONS_SHARP_REGULAR_TTF_LOCAL_SRC}
  woff2_compress ${MATERIAL_ICONS_SHARP_REGULAR_TTF_LOCAL_SRC} >${MATERIAL_ICONS_SHARP_REGULAR_WOFF2_DIST}
  # two tone regular
  mkeot ${MATERIAL_ICONS_TWOTONE_REGULAR_OTF_LOCAL_SRC} >${MATERIAL_ICONS_TWOTONE_REGULAR_EOT_LOCAL_SRC}
  eot2ttf ${MATERIAL_ICONS_TWOTONE_REGULAR_EOT_LOCAL_SRC} ${MATERIAL_ICONS_TWOTONE_REGULAR_TTF_LOCAL_SRC}
  woff2_compress ${MATERIAL_ICONS_TWOTONE_REGULAR_TTF_LOCAL_SRC} >${MATERIAL_ICONS_TWOTONE_REGULAR_WOFF2_DIST}
  # copy ttf source fonts to dist
  cp ./src/*.ttf ./iconfont
}

##
# Generates the iconfont.
##
generate() {
  installTools
  cleanupSourceAndDistFonts
  downloadSourceFonts
  createFontsDist
}

generate
