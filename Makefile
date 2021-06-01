
dup:
	docker-compose up -d

dstop:
	docker-compose stop

mylogin2:
	docker exec -t mysql_host mysql -uroot -proot -P 3306 -h "127.0.0.1" local_db
mylogin:
	mysql -h "127.0.0.1" -uroot -proot local_db

table-init:
	mysql -h "127.0.0.1" -uroot -proot local_db < "./sql/001-create-tables.sql"

insert-data:
	mysql -h "127.0.0.1" -uroot -proot local_db < "./sql/002-insert-test_user.sql"

setup-grpc:
	brew install protobuf