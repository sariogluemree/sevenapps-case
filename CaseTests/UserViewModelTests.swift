//
//  UserViewModelTests.swift
//  CaseTests
//
//  Created by Hüseyin Emre Sarıoğlu on 12.03.2025.
//

import XCTest
@testable import Case

final class UserViewModelTests: XCTestCase {
    
    func testFetchUsersSuccess() {

        let mockRepository = MockUserRepository()
        let viewModel = UserViewModel(repository: mockRepository)
        
        let expectation = XCTestExpectation(description: "Users fetched successfully")
        
        viewModel.onUsersFetched = {
            XCTAssertFalse(viewModel.users.isEmpty, "User listesi boş olmamalı!")
            XCTAssertEqual(viewModel.users.first?.name, "Leanne Graham", "İlk kullanıcının adı yanlış!")
            expectation.fulfill()
        }

        viewModel.fetchUsers()

        wait(for: [expectation], timeout: 2.0)
    }

}
