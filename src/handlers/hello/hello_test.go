package hello_test

import (
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/desk467/base-golang/src/handlers/hello"
	"github.com/gofiber/fiber/v2"
	"github.com/stretchr/testify/assert"
)

func createSUT() *fiber.App {
	app := fiber.New()
	sut := hello.CreateHelloHandler()

	sut.Configure(app)

	return app
}

// Should return Hello World
func TestHelloOKCase(t *testing.T) {
	// arrange
	app := createSUT()
	req := httptest.NewRequest("GET", "/", nil)

	// act
	resp, _ := app.Test(req, 1)
	data, _ := ioutil.ReadAll(resp.Body)

	// assert
	assert.Equal(t, http.StatusOK, resp.StatusCode, "Return 200 OK")
	assert.Equal(t, "Hello, World 👋!", string(data), "Return correct body")
}
