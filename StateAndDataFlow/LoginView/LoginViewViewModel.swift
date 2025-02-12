//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    // MARK: - Public Properties
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    var userNameCharCount: String {
        user.name.count.formatted()
    }
    
    // MARK: - Private Properties
    private let storageManager = StorageManager.shared
    
    // MARK: - Initializers
    init(user: User = User()) {
        self.user = user
    }
    
    // MARK: - Public Methods
    func login() {
        user.isLoggedIn.toggle()
        storageManager.save(user: user)
    }
    
    func logout() {
        user.name = ""
        user.isLoggedIn.toggle()
        storageManager.clear()
    }
}
