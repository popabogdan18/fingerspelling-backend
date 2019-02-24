//
//  User.swift
//  App
//
//  Created by Bogdan on 24/02/2019.
//

import FluentSQLite
import Vapor
import Authentication

/// A single entry of a Todo list.
final class User: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    
    /// A title describing what this `Todo` entails.
    var email: String
    var password: String
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

extension User: TokenAuthenticatable {
    typealias TokenType = Token
}

extension User {
    struct UserPublic: Content {
        let id: Int
        let email: String
    }
}
