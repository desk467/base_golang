package core

import "github.com/gofiber/fiber/v2"

type Handler interface {
	Configure(app *fiber.App)
}

func ConfigureHandlers(app *fiber.App, handlers ...Handler) {
	for _, handler := range handlers {
		handler.Configure(app)
	}
}
