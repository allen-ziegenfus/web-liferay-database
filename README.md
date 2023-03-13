# Setting up the database

1. Check https://files.liferay.com/private/lrdcom to find a recent version of the web database (developer_lportal). Configure `get_database.sh` to fetch that version (update SERVER variable)
2. Run `get_database.sh` to get a copy of the database from the operations vm -> `./database/docker-entrypoint-initdb.d/lportal.sql`. By default it pulls the database from the nightly server. This script will also remove any existing `lportal.sql` file before starting the download.
3. Run `docker-compose up` to start the database. It runs on port 3306 and can be accessed via the user `dxpcloud` with password `passw0rd`. 
4. Note that importing the full database will take a very long time (the better part of day)

# Connecting to the database from liferay

You can use these settings to connect from liferay:

```
jdbc.default.url=jdbc:mysql://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
jdbc.default.username=dxpcloud
jdbc.default.password=passw0rd
```

# Refreshing from the sql file when already downloaded

1. `init_db.sh` will stop docker, remove the docker volume and restart (causing the volume to populate again from the sql file). This way you can easily reset the database to its original state.