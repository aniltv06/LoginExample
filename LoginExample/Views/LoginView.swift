//
//  LoginView.swift
//  LoginExample
//
//  Created by Anil Kumar T V on 4/4/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel

    @State private var userName = "kminchelle"
    @State private var password = "0lelplR"

    var body: some View {
        VStack {
            TextField("User Name", text: $userName)
                .padding()
            SecureField("Password", text: $password)
                .padding()
            Button(action: {
                Task {
                    await viewModel.login(username: userName, password: password)
                }
            }, label: {
                Text("Login")
            })
            .disabled(viewModel.isLoggingIn)
            .padding()
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            if let user = viewModel.user {
                Text("Welcome, \(user.firstName) \(user.lastName)")
                    .padding()
            }
        }
        .padding()
    }
}
