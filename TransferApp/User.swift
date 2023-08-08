//
//  User.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import Foundation

class User {
    var username: String
    var password: String
    var userAccountBalance: Double
    
    init(username: String, password: String, userAccountBalance: Double) {
        self.username = username
        self.password = password
        self.userAccountBalance = userAccountBalance
    }
}
