//
//  LoginViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import UIKit

class LoginViewController: UIViewController {
    
    let fillDemoUser1: Bool = true
    
    let userManager: UserManager
    init(userManager: UserManager) {
        self.userManager = userManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var loginViewLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        if fillDemoUser1 {
            userManager.setDemoUser1(usernameTextField: usernameTextField, passwordTextField: passwordTextField, userBalanceLabel: UILabel())
        }
    }
    
    func configureUI() {
        loginViewLabel.text = "Welcome"
        usernameTextField.placeholder = "Enter Your Username"
        passwordTextField.placeholder = "Enter Your Password"
        enterButton.setTitle("Enter", for: .normal)
    }

    @IBAction func enterButtonTapped(_ sender: Any) {
        let transferViewController = TransferViewController(currentUser: User(username: "", password: "", userAccountBalance: 260.0))
        ;navigationController?.pushViewController(transferViewController, animated: true)
    }
}
