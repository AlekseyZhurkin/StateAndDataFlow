//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            TextFieldView(loginViewVM: loginViewVM)
                .multilineTextAlignment(.center)
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!loginViewVM.nameIsValid)
        }
        .padding()
    }
}

struct TextFieldView: View {
    // MARK: - Properties
    @ObservedObject var loginViewVM: LoginViewViewModel
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $loginViewVM.user.name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text(loginViewVM.userNameCharCount)
                    .font(.callout)
                    .foregroundStyle(loginViewVM.nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
