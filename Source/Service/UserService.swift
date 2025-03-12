//
//  UserService.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 9.03.2025.
//

import Foundation

class UserService {
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = APIConstants.usersURL else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
