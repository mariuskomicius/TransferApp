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
    var userAccountBalance: Double = 0.0
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
