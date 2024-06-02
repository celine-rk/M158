# Realisierung Modul 169
In dieser Anleitung wird gezeigt, wie man die sechs Docker Container startet, die für die beiden Moodle Instanzen benötigt werden und wie dies mit Hilfe von **Docker Compose** startet.

## Hinweise zur Funktionalität
Um die Funktionalität des Produktes zu gewährleisten, muss zwingend Ubuntu als Betriebssystem verwendet werden, da ansonsten nicht gewährleistet werden kann, dass alle Bestandteile des Produktes einwandfrei funktionieren. Ausserdem müssen Docker und Docker-Compose zwingend installiert und funktionsfähig sein.

Weiter zu beachten gibt es, dass es zu Problemen führen kann, sollte eine **bitnami/moodle** Instanz bereits gelaufen sein sollte.

# Anleitung zur verwendung des Produktes
### Download der Dateien
Um den Ausführungsprozess zu beschleunigen, muss der Ordner ["Moodle"](https://github.com/celine-rk/M158/tree/main/Moodle) heruntergeladen werden. Optional kann auch das Gesamte Repository heruntergeladen werden. 
**Die  "*.sql.zip" files dürfen nicht enpackt werden.**
### Vorbereitung
Der Inhalt des Ordners ["Moodle"](https://github.com/celine-rk/M158/tree/main/Moodle) muss in ein separates leeres Verzeichnis kopiert werden.
Danach sollten Sie mit der Konsole in dieses Verzeichnis wechseln, verwenden sie dafür den Befehl `cd Ihr\Pfad\`.
### Docker Compose ausführen
Sobald Sie sich in ihrem im Verzeichnis befinden, in welchem sich das DockerCompose.yaml file befindet, können sie dies mit diesem Befehl starten:

`docker-compose up -d` oder `docker compose up -d`

Wenn Sie eine detaillierte Ausgabe wünschen, können Sie folgenden Befehl verwenden:

`docker-compose up` oder `docker compose up`

Warten Sie dann einige Minuten, bis der Start erfolgreich war. Sie haben den Parameter -d weggelassen ? In der Konsole sollte **Apache start** zu sehen sein. (ggf. muss etwas nach oben gescrollt werden)

### Datenbank importieren
Die Datenbank kann über PhpMyAdmin importiert werden, dieser unterscheidet sich im wesentlichen nicht von der alten zur neuen Moodle-Version, nur der DB-Name sowie der Port sind unterschiedlich.

Die Webseiten mit PhpMyAdmin sind unter **localhost:88** für das neue Moodle und auf **localhost:8088** für das alte Moodle erreichbar. Sie können dafür folgende Links verwenden:

["PHPmyadmin altes Moodle"](http://127.0.0.1:8088)

["PHPmyadmin neues Moodle"](http://127.0.0.1:88)

Für den Login können die anbei liegenden Logindaten verwendet werden.

|Username|Passwort|
|-----|----|
|root|MuMissduP1434!|
|moodle|Riethuesli>12345678910!|

Wichtig!: Für die weiterführende Installation bitte den **root** Benutzer wählen. Der **moodle** Benutzer hat keine Berechtigungen um Datenbanken zu löschen

Danach können Sie die Datenbank **moodel_old** oder **moodle_new** löschen. Sie finden dieses feature unter **Operations > Remove database**. 
Sobald Sie die Datenbank gelöscht haben können Sie eine neue Datenbank mit dem selben Namen erstellen.

Wenn dies erfolgreich war, können Sie unter **Import** die Datenbank als **zip** file importieren. 
⚠️ Der Import muss als **zip-Datei** erfolgen, da der Dump sonst  für PhpMyAdmin zu gross ist. 

Klicken Sie dann auf den Import-Button, bis eine Suchmeldung erscheint. Danach können Sie mit der anderen Moodle-Version fortfahren, falls Sie dies noch nicht bereits getan haben.

### Ausnahme neues Moodle 
Falls das neue Moodle eine Nachinstallation von Plugins erfordert, klicken Sie sich durch den Upgrade-Assistenten, der sich automatisch öffnet, und installieren Sie die Plugins nach.

### Ende
Sie haben nun den Import abgeschlossen, Sie können das neue Moodle unter **localhost:80** und das alte Moodle über **localhost:8080** aufrufen. Sie können dafür folgende Links verwenden:

["altes Moodle"](http://127.0.0.1:8080)

["neues Moodle"](http://127.0.0.1:80)


# Rechtliche Hinweise
Dieses Dokument wurde von Céline König und Finn de Pauw Gerlings unter Berücksichtigung aller technischen Kenntnisse über das Abgabeprodukt erstellt.

Wir übernehmen keine Haftung für eventuelle Schäden am System, z.B. Datenverlust, sowie für Folgeschäden, die durch Schäden am System verursacht werden. 

Für die Rechtschreibprüfung haben wir das Produkt "DeepL Write" der Firma "DeepL SE" mit Sitz in Köln, Deutschland, verwendet.
