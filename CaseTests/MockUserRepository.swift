//
//  MockUserRepository.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 12.03.2025.
//

import Foundation

class MockUserRepository: UserRepositoryProtocol {
    var shouldReturnError = false
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "TestError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Test error message"])))
        } else {
            let mockUsers = [
                User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz",
                     address: Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-37.3159", lng: "81.1496")),
                     phone: "1-770-736-8031 x56442", website: "hildegard.org",
                     company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"))
            ]
            completion(.success(mockUsers))
        }
    }
}
