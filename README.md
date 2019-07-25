# docker-webserver
Bei diesem Webserver sind Apache2, PHP (siehe Tags) und Composer installiert.
Dieser Webserver dient in erster Linie für entwicklungs zwecken auf dem eigenen Compuer oder gegebenfalls auf einem Server.
Der Server ist meinerseiote nicht für den Produktiven Betrieb gedacht.

Eine Datenbank ist in diesem Webserver jedoch absichtlich nicht vorhanden, diese kann per separatem Conainer erstellt werden.

## Installation
Mit folgendem Befehl kannst du einen Docker Container mit diesem Webserver starten. Zurzeit gbt es diesen nur mit der PHP-Version 7.3, geplant sind jedoch weitere, tiefere Versionen.
```
docker run -d --name [CONTAINER_NAME] -h [HOST_NAME] -p 80:80 -v [PFAD_ZUM_PROJEKT]:/var/www/html memenu/webserver:7.3
```

Wobei du `[CONTAINER_NAME]` mit eine, Beliebigen Namen den zu dem Container geben möchtest, ersetzt.
`[HOST_NAME]`, dieser kannst du in der Regel gleich wie deinen Containernamen machen. Anschliessend ist da noch dein Projektpfad, dies ist der Pfad zu deinen HTML/PHP Dateien, zB. `C:/htdocs`.

Die 7.3 nach dem Doppelpunkt definiert die gewünschte PHP-Version. Wobei bei `latest` immer die neuste PHP-Version die ich anbiete geladen wird. (siehe Tags)

Anschliessend ist deine Webseite oder dein Projekt unter `http://localhost` erreichbar.

## Composer
Solltest du bei deinem Projekt mit Composer arbeten, so kannst du dies direkt durch den Container erledigen.
Mit folgenden Befehl verbindest du dich direkt mit der Konsole des Containers:
```
docker exec -it [CONTAINER_NAME] /bin/bash
```
Nun wechseln wir in das richtige Verzeichnis und installieren Composer 
```
cd /var/www/html && composer install
```


