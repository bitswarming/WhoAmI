package whoami

import (
    "fmt"
    "net/http"
        "fmt"
        "github.com/gorilla/mux"
        "strings"
        "net/http"
        "net"

)

func init() {
    http.HandleFunc("/", handler)
}

func handler(w http.ResponseWriter, r *http.Request) {
 ip := strings.Split(r.RemoteAddr,":")[0]
        w.Header().Set("Content-Type", "application/json; charset=UTF-8")
        w.WriteHeader(http.StatusOK)
        w.Write([]byte(ip))
}
