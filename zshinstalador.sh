#!/bin/bash

# Función para instalar Oh My Zsh
instalar_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Verificar si Oh My Zsh está instalado
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh no está instalado. Instalando..."
    instalar_oh_my_zsh
fi

# Verificar si se proporcionó un nombre de tema
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <nombre-del-tema>"
    exit 1
fi

TEMA="$1"
RUTA_TEMA="$HOME/.oh-my-zsh/custom/themes/$TEMA.zsh-theme"

# Si el tema ya está instalado
if [ -f "$RUTA_TEMA" ]; then
    echo "El tema $TEMA ya está instalado."
    exit 0
fi

# Intentar descargar el tema desde el repositorio oficial de Oh My Zsh
curl -o "$RUTA_TEMA" "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/themes/$TEMA.zsh-theme"

# Verificar si se descargó correctamente
if [ -f "$RUTA_TEMA" ]; then
    echo "Tema $TEMA instalado exitosamente. No olvides configurar tu .zshrc."
else
    echo "No se pudo encontrar o descargar el tema $TEMA desde el repositorio oficial."
fi

# por  alfcl  https://github.com/alfcl
