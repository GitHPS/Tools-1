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
