//
//  AuthenticationService.swift
//  LoginExample
//
//  Created by Anil Kumar T V on 4/4/24.
//

import Foundation

enum LoginError: Error {
    case noURL
    case decoding
    case unknown(Error)
}

protocol ServiceManager {
    func performLogin(userName: String, password: String) async throws -> User
}

class AuthenticationService: ServiceManager {
    private let loginURLString = "https://dummyjson.com/auth/login"

    func performLogin(userName: String, password: String) async throws -> User {
        guard let url = URL(string: loginURLString) else {
            throw LoginError.noURL
        }

        let loginModel = LoginModel(username: userName, password: password)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONEncoder().encode(loginModel)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let responseData = try JSONDecoder().decode(User.self, from: data)
            return responseData
        } catch {
            throw LoginError.unknown(error)
        }
    }
}

