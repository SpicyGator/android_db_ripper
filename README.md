# android_db_ripper
Small script to make pulling app databases easier

Wrote this when in a mobile forensics course and we were analyzing app databases.  Rather than copying the db to the sdcard and pulling, this will find every .db file in */data/data*, recreate the directory tree, and pull the .db files via adb.
