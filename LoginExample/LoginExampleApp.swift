//
//  LoginExampleApp.swift
//  LoginExample
//
//  Created by Anil Kumar T V on 4/4/24.
//

import SwiftUI

@main
struct LoginExampleApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(service: AuthenticationService()))
        }
    }
}
