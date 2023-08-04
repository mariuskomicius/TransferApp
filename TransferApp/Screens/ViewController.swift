//
//  ViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import UIKit

class ViewController: UIViewController {
    
    let userManager = UserManager(users: [], currentUser: (User(username: "", password: "")), registeredUsers: [])
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        welcomeLabel.text = "Welcome to Transfer App"
        loginButton.setTitle("Login", for: .normal)
        registerButton.setTitle("Register", for: .normal)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let loginViewController = LoginViewController(userManager: userManager)
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
}

