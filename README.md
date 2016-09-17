# Tools
Tools Collection

## Import lnkin database tool (**import_lnkin.sh**)

Examples of simple queries after importing DB

1. Search user and password by username : 
   mysql -Dlnkin -uroot -p -e "select * from users where username = 'user@email.com';"
2. Search user by password:
   mysql -Dlnkin -uroot -p -e "select * from users where password='2ec371570f897c99e1a791cfe71dd6ad3c7558bc';"
3. Search user like @m4x.or :
   mysql -Dlnkin -uroot -p -e "select * from users where username like '%@m4x.or%';"
