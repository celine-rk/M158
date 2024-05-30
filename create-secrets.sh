#!/bin/bash

# Autor: Céline König
# Erstellt am: 30.05.2024

# Erstellt die verwendeten Secrets im docker-compose.yaml
# Funktion, um ein zufälliges Passwort zu generieren
generate_password() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1
}

# Pfad zum Speichern der Secrets
SECRETS_DIR="${HOME}/secrets"

# Array von Secrets und ihren Dateinamen
declare -A secrets=(
    ["old_root_password"]="old_root_password.txt"
    ["moodle_password"]="moodle_password.txt"
    ["new_root_password"]="new_root_password.txt"
)

# Erstelle das Verzeichnis, falls es nicht existiert
mkdir -p "$SECRETS_DIR"

# Iteriere durch jedes Secret
for secret_name in "${!secrets[@]}"; do
    # Generiere ein zufälliges Passwort
    password=$(generate_password)
    
    # Speichere das Passwort in der Datei
    echo "$password" > "$SECRETS_DIR/${secrets[$secret_name]}"
done

# Ausgabe der Bestätigung
echo "Secrets wurden erstellt: ${secrets[@]}"
