//
//  UserViewModel.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 9.03.2025.
//

import Foundation

class UserViewModel {
    private let repository: UserRepositoryProtocol
    var users : [User] = []
    var onUsersFetched: (() -> Void)?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func fetchUsers() {
        repository.getUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.onUsersFetched?()
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
    }
    
}
