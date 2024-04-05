//
//  User.swift
//  LoginExample
//
//  Created by Anil Kumar T V on 4/4/24.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: URL
    let token: String
}
