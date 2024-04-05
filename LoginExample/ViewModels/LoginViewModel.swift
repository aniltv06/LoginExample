//
//  LoginViewModel.swift
//  LoginExample
//
//  Created by Anil Kumar T V on 4/4/24.
//

import Foundation
import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {
    @Published var isLoggingIn = false
    @Published var errorMessage: String?
    @Published var user: User?

    private let service: ServiceManager

    init(service: ServiceManager) {
        self.service = service
    }

    func login(username: String, password: String) async {
        errorMessage = nil
        isLoggingIn = true
        do {
            let user = try await service.performLogin(userName: username, password: password)
            self.user = user
        } catch {
            errorMessage = "Login failed. Please try again."
        }
        isLoggingIn = false
    }
}

