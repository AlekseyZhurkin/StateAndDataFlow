//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Алексей Журкин on 12.02.2025.
//

import SwiftUI

class StorageManager {
    // MARK: - Public Properties
    static let shared = StorageManager()
    
    // MARK: - Private Properties
    @AppStorage("User") private var userData: Data?
    
    // MARK: - Initializers
    private init() {}

    // MARK: - Public Methods
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        return user ?? User()
    }
    
    func clear() {
        userData = nil
    }
}
