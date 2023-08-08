//
//  UserManager.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import Foundation
import UIKit

class UserManager {
    
    static let shared = UserManager(users: [], currentUser: User(username: "", password: ""))
    
    var users: [User] = []
    var currentUser: User
    // var registeredUsers: [User] = []
    
    init(users: [User], currentUser: User) {
        self.users = users
        self.currentUser = currentUser
       // self.registeredUsers = registeredUsers
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
            createUser(username: username, password: password, userAccountBallance: 0.0)
        }
    }
    
    
    
    func createUser(username: String, password: String, userAccountBallance: Double) -> Bool {
        var newUser = User(username: "", password: "")
        users.append(newUser)
        currentUser = newUser
        return true
    }
    
   // func registerUser(username: String, password: String) {
     //   let user = User(username: username, password: password)
       // registeredUsers.append(user)
  //  }
}

extension User {
    func setDemoUser1(usernameTextField: UITextField!, passwordTextField: UITextField!) {
        usernameTextField.text = "DemoUser1"
        passwordTextField.text = "DemoUser1"
        //userBalanceLabel.text = "100.0"
        
    }
    func setDemoUser2(usernameTextField: UITextField!, passwordTextField: UITextField!, userBalanceLabel: UILabel!) {
        usernameTextField.text = "DemoUser2"
        passwordTextField.text = "DemoUser2"
        userBalanceLabel.text = "200.0"
    }
}
