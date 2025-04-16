#!/bin/sh

mkdir -p "${PREFIX}/Menu"
cp "${RECIPE_DIR}/menu.json" "${PREFIX}/Menu/${PKG_NAME}_menu.json"
cp "${RECIPE_DIR}/msui.png" "${PREFIX}/Menu/msui.png"
cp "${RECIPE_DIR}/msui.icns" "${PREFIX}/Menu/msui.icns"

"${PYTHON}" -m pip install . --no-deps -vv
