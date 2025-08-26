#!/bin/bash

# Prüft, ob ein Dateipfad als Argument übergeben wurde
if [ -z "$1" ]; then
  echo "Fehler: Bitte gib den Pfad zur Datei als Argument an."
  echo "Beispiel: ./rename_file.sh dateiname.txt"
  exit 1
fi

# Extrahiert die zweite Zeile, trennt sie am Doppelpunkt, trimmt und entfernt das Komma
cleaned_name=$(sed -n '2p' "$1" | cut -d':' -f2 | xargs | sed 's/,$//')

# Prüft, ob ein bereinigter Name extrahiert werden konnte
if [ -z "$cleaned_name" ]; then
  echo "Fehler: Konnte keine gültige Ausgabe für die Umbenennung finden."
  exit 1
fi

# Setzt den neuen Dateinamen mit der Endung .json
new_filename="${cleaned_name}.json"

# Benennt die Datei um
mv "$1" "$new_filename"

echo "Die Datei '$1' wurde erfolgreich in '$new_filename' umbenannt."
