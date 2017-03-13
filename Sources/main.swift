import Vapor
import Foundation

let drop = Droplet()

drop.get("/hello") { _ in
    return "Pizza Cat!!!!"
}


var names = [String]()

drop.get("/pizza_cat") { _ in
    var string = ""
    
    for name in names {
        string += "\(name) "
    }
    
    return string
}

drop.post("/pizza_cat") { request in
    
    guard let name = request.data["name"]?.string else {
        return "Could not find name"
    }

    names.append(name)
    
    return "name added: \(name)"
}

drop.run()
