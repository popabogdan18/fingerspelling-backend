import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("myroute") { req in
        return "A new route!"
    }
    
    // Example of configuring a controller
    let userController = UserController()
    router.get("todos", use: userController.index)
    router.post("todos", use: userController.create)
    router.delete("todos", User.parameter, use: userController.delete)
    router.post("register", use: userController.register)
    router.post("login", use: userController.login)
    
    let tokenAuthenticationMiddleware = User.tokenAuthMiddleware()
    let authedRoutes = router.grouped(tokenAuthenticationMiddleware)
    authedRoutes.get("profile", use: userController.profile)
    authedRoutes.get("logout", use: userController.logout)
}
