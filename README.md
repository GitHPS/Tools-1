# Tools
Tools Collection

## Import lnkin database tool (import_lnkin.sh)

If mariadb is not installed, then follow this steps on fedora:

1. Using root or with sudo, install mariadb client and database: **dnf install mariadb mariadb-server**
2. Start db engine: **systemctl start mariadb**
3. configure your installation (define db root password and accept all others default options): **mysql_secure_installation**
4. Edit import_lnkin.sh and set script variables ( db user and db password)
5. Goto directory where you put those lnkin txt files and just ./import_lnkin.sh :)

Examples of simple queries after importing DB

1. Search user and password by username : 
   **mysql -Dlnkin -uroot -p -e "select * from users where username = 'user@email.com';"**
2. Search user by password:
   **mysql -Dlnkin -uroot -p -e "select * from users where password='2ec371570f897c99e1a791cfe71dd6ad3c7558bc';"**
3. Search user like @m4x.or :
   **mysql -Dlnkin -uroot -p -e "select * from users where username like '%@m4x.or%';"**

## Import lnkin database tool NEW VERSION

Just because I have a vintage computer (core2duo@2.93GHz with sata 7200 rpm J ), I decided to implement some changes in order to make things easy and faster. Here a brief discription about all changes made including the new scripts added.

1. **import_lnkinV2.sh**: Implemented some changes to database structure. Added some indexes and changed data types. Log file implemented. 
2. **config.sh**: Separated file for config vars (Database username and password, log file name.
3. **find.all.like.sh**: Execute a simple query for finding username and password havin a sequence of chars in any part of the username field.
4. **find.sh**: Find username and password of a single user
5. **export.all.like.sh**: Same as find.all.like.sh exporting a file in passwd format to use with John. J

Here how it went in my vintage PC and some useful examples

**Import process log file**



