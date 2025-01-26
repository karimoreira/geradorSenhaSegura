#!/bin/bash

# Gerador de Senhas Seguras

# (padrão: 12 caracteres) 
LENGTH=${1:-12}


INCLUDE_SPECIAL=${2:-"no"}


LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
NUMBERS="0123456789"
SPECIAL="!@#$%^&*()-_=+<>?/"


CHAR_SET="$LOWERCASE$UPPERCASE$NUMBERS"

if [[ "$INCLUDE_SPECIAL" == "yes" ]]; then
    CHAR_SET+="$SPECIAL"
fi


PASSWORD=$(tr -dc "$CHAR_SET" < /dev/urandom | head -c "$LENGTH")


if command -v xclip &>/dev/null; then
    echo -n "$PASSWORD" | xclip -selection clipboard
    echo "Senha copiada para a área de transferência!"
elif command -v pbcopy &>/dev/null; then
    echo -n "$PASSWORD" | pbcopy
    echo "Senha copiada para a área de transferência!"
else
    echo "Copie manualmente: $PASSWORD"
fi

