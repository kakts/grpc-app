
dup:
	docker-compose up -d

dstop:
	docker-compose stop

mylogin:
	mysql -h "127.0.0.1" -P 3307 -uroot -proot local_db

table-init:
	mysql -h "127.0.0.1" -P 3307 -uroot -proot local_db < "./sql/001-create-tables.sql"

insert-data:
	mysql -h "127.0.0.1" -P 3307 -uroot -proot local_db < "./sql/002-insert-test_user.sql"