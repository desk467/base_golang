package main

import (
	"github.com/desk467/base-golang/src/core"
	"github.com/desk467/base-golang/src/handlers/hello"
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	core.ConfigureHandlers(
		app,

		// New Handlers should be added here
		hello.CreateHelloHandler(),
	)

	err := app.Listen(":3000")
	if err != nil {
		panic(err)
	}
}
