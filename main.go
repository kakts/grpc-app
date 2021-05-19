package main

import (
	"fmt"
	"time"

	"github.com/kakts/grpc-app/repository"
)

type TestUser struct {
	ID        uint       `gorm:"primary_key" json:"id"`
	Name      string     `json:"name"`
	CreatedAt *time.Time `json:"created_at"`
	UpdatedAt *time.Time `json:"updated_at"`
}

func main() {
	db := repository.NewDB()
	fmt.Println(db)
	foundUsers := []TestUser{}
	db.Connection.Find(&foundUsers)
	if len(foundUsers) == 0 {
		fmt.Printf("not found users")
	}

	fmt.Println(foundUsers)

	foundUser := TestUser{}
	db.Connection.First(&foundUser, 1)
	// 取得できない場合はIDが初期値の1になる
	if foundUser.ID == 0 {
		panic("user not found")
	}

	fmt.Println(foundUser)
	fmt.Println(foundUser.ID)

}
