//
//  UserManager.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import Foundation
import UIKit

class UserManager {
    
    static let shared = UserManager(users: [], currentUser: User(username: "", password: "", userAccountBalance: 220.0))
    
    var users: [User] = []
    var currentUser: User
    var registeredUsers: [User] = []
    
    init(users: [User], currentUser: User) {
        self.users = users
        self.currentUser = currentUser
        // self.registeredUsers = registeredUsers
    }
    
    func login(username: String, password: String) {
        var isRegistered = false
        for user in users {
            let username = user.username
            if username == username {
                isRegistered = true
                currentUser = user
            }
        }
        if isRegistered == false {
            createUser(username: username, password: password, userAccountBallance: 230.0)
        }
    }
    
    func createUser(username: String, password: String, userAccountBallance: Double) -> Bool {
        var newUser = User(username: "", password: "", userAccountBalance: 240.0)
        users.append(newUser)
        currentUser = newUser
        return true
    }
    
    func registerUser(username: String, password: String) -> Bool {
        let user = User(username: username, password: password, userAccountBalance: 0.0)
         registeredUsers.append(user)
        guard username.count >= 8 && password.count >= 8 && !isUsernameUsed(username) else {
            return false
        }
        
        let newUser = User(username: username, password: password, userAccountBalance: 0.0)
               users.append(newUser)
               currentUser = newUser
               return true
    }
    
    func isUsernameUsed(_ username: String) -> Bool {
            return users.contains { $0.username == username }
        }
}

extension UserManager {
    func setDemoUser1(usernameTextField: UITextField!, passwordTextField: UITextField!, userBalanceLabel: UILabel) {
        usernameTextField.text = "DemoUser1"
        passwordTextField.text = "DemoUser1"
        userBalanceLabel.text = "\(currentUser.userAccountBalance)"
        
    }
    func setDemoUser2(usernameTextField: UITextField!, passwordTextField: UITextField!, userBalanceLabel: UILabel) {
        usernameTextField.text = "DemoUser2"
        passwordTextField.text = "DemoUser2"
        userBalanceLabel.text = "\(currentUser.userAccountBalance)"
    }
}
