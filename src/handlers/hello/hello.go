package hello

import "github.com/gofiber/fiber/v2"

type HelloHandler struct{}

func (handler *HelloHandler) Configure(app *fiber.App) {
	app.Get("/", handler.handleHello)
}

func (handler *HelloHandler) handleHello(c *fiber.Ctx) error {
	return c.SendString("Hello, World 👋!")
}

func CreateHelloHandler() *HelloHandler {
	return &HelloHandler{}
}
