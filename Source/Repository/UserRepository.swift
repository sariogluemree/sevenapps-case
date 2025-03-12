//
//  UserRepository.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 9.03.2025.
//

import Foundation

//user repository ve test amaçlı oluşturduğum mock reposityory için protocol oluşturdum.
protocol UserRepositoryProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

class UserRepository: UserRepositoryProtocol {
    
    private let userService = UserService()
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        userService.fetchUsers { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
}
