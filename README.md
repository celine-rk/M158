# Realisierung Modul 169
In dieser Anleitung wird gezeigt, wie man die vier Docker Container startet, die für die beiden Moodle Instanzen benötigt werden, wie man die entsprechenden Images mit Hilfe des Docker Files erstellt und wie man sie mit Hilfe von Docker Compose startet.

## Hinweise zur Funktionalität
Um die Funktionalität des Produktes zu gewährleisten, muss zwingend Ubuntu als Betriebssystem verwendet werden, da ansonsten nicht gewährleistet werden kann, dass Skripte und andere Bestandteile des Produktes einwandfrei funktionieren. Ausserdem müssen Docker und Docker-Compose zwingend vorhanden und funktionsfähig sein.

Der Ordner ${Home}/Secrets wird automatisch erstellt, um die Passwortdateien zu speichern. **Wenn dieser Ordner bereits existiert, wird er gelöscht, was zu Datenverlust führen kann!**

# Anleitung zur verwendung des Produktes
Um das Programm nutzen zu können, muss [das Skript "pre-ceation.sh"](https://github.com/celine-rk/M158/blob/main/pre-ceation.sh) ausgeführt werden, damit die entsprechenden Secret Files erstellt und die Netzwerke angelegt werden.
 
 




# Rechtliche Hinweise
Dieses Dokument wurde von Céline König und Finn de Pauw Gerlings unter Berücksichtigung aller technischen Kenntnisse über das Abgabeprodukt erstellt.

Wir übernehmen keine Haftung für eventuelle Schäden am System, z.B. Datenverlust, sowie für Folgeschäden, die durch Schäden am System verursacht werden. 

Für die Rechtschreibprüfung haben wir das Produkt "DeepL Write" der Firma "DeepL SE" mit Sitz in Köln, Deutschland, verwendet.