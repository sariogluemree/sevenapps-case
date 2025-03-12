//
//  APIConstants.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 12.03.2025.
//

import Foundation

//ilerde farklı endpointler eklenirse diye bu şekilde bir yapı oluşturdum.
struct APIConstants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    static let usersEndpoint = "/users"
    
    static var usersURL: URL? {
        return URL(string: baseURL + usersEndpoint)
    }
}
