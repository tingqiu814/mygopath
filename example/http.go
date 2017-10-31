package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	url := "baidu.com"
	resp, err := http.Get(url)
	if err != nil {
		// error handle
		fmt.Println(err)
	}

	res, err := ioutil.ReadAll(resp.body)
	if err != nil {
		// error handle
		fmt.Println(err)
	}

	fmt.Println(res)
}
