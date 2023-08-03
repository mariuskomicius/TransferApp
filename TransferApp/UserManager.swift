//
//  UserManager.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import Foundation

class UserManager {
    var users: [User] = []
    var currentUser: User
    var registeredUsers: [User] = []
    
   
    
    init(users: [User], currentUser: User, registeredUsers: [User]) {
        self.users = users
        self.currentUser = currentUser
        self.registeredUsers = registeredUsers
    }
    
    func join(username: String, password: String) {
        var isRegistered = false
        for user in users {
            let username = user.username
            if username == username {
                isRegistered = true
                currentUser = user
            }
        }
        if isRegistered == false {
            createUser(username: username, password: password)
        }
    }
    
    func createUser(username: String, password: String) {
        var newUser = User(username: "", password: "")
        users.append(newUser)
        currentUser = newUser
    }
    
    func registerUser(username: String, password: String) {
        let user = User(username: username, password: password)
        registeredUsers.append(user)
    }
}
