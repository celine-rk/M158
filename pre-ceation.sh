#!/bin/bash

# Erstellt die verwendeten Secrets im docker-compose.yaml
# Funktion, um ein zufälliges Passwort zu generieren
generate_password() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1
}

# Pfad zum Speichern der Secrets
SECRETS_DIR="/secrets"

# Array von Secrets und ihren Dateinamen
declare -A secrets=(
    ["old_root_password"]="old_root_password.txt"
    ["moodle_password"]="moodle_password.txt"
    ["new_root_password"]="new_root_password.txt"
)

# Erstellung und Löschung von SECRETS_DIR 
if [[ -d "$SECRETS_DIR" ]]; then
    echo "Der Ordner $SECRETS_DIR existiert bereits und wird aus Fehlertoleranzgründen gelöscht!"
    rm -rf "$SECRETS_DIR"
    mkdir -p "$SECRETS_DIR"
else
    echo "Der Ordner wurde nicht gefunden und wird daher neu erstellt"
    mkdir -p "$SECRETS_DIR"
fi

# Iteriere durch jedes Secret
for secret_name in "${!secrets[@]}"; do
    # Generiere ein zufälliges Passwort
    password=$(generate_password)
    
    # Speichere das Passwort in der entsprechenden Datei
    echo "$password" > "$SECRETS_DIR/${secrets[$secret_name]}"
done

# Ausgabe der Bestätigung
echo "Secrets wurden erstellt: ${secrets[@]}"

SEPARATOR="----------------------------------------------------------"

# Docker Netzwerk erstellen
# Variablen der Docker-Netzwerke
NETWORK_OLD="moodle-old"
NETWORK_NEW="moodle-new"

echo "$SEPARATOR"
# Funktion, um ein Docker-Netzwerk zu erstellen
create_network() {
    local network_name=$1
    if [ ! "$(docker network ls --filter name=^${network_name}$ --format="{{ .Name }}")" ]; then
        echo "Erstelle Docker-Netzwerk: $network_name"
        docker network create $network_name
    else
        echo "Docker-Netzwerk $network_name existiert bereits."
    fi
}

# Erstelle die Netzwerke
create_network $NETWORK_OLD
create_network $NETWORK_NEW

# Ausgabe der Bestätigung
echo "Docker-Netzwerke wurden erstellt."

