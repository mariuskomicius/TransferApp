//
//  RegisterViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let fillDemoUser2: Bool = true
    
    var userManager = UserManager.shared
    init(userManager: UserManager) {
        self.userManager = userManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var welcomeNewUserLabel: UILabel!
    @IBOutlet weak var usernameSymbolsLabel: UILabel!
    @IBOutlet weak var createUsernameTextField: UITextField!
    @IBOutlet weak var passwordSymbolsLabel: UILabel!
    @IBOutlet weak var createPasswordTextField: UITextField!
    @IBOutlet weak var registerUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        if fillDemoUser2 {
            userManager.setDemoUser2(usernameTextField: createUsernameTextField, passwordTextField: createPasswordTextField, userBalanceLabel: UILabel())
        }
    }
    
    func configureUI() {
        welcomeNewUserLabel.text = "Welcome, new User"
        usernameSymbolsLabel.text = "Username must be at least 8 symbols"
        createUsernameTextField.placeholder = "Create Username"
        passwordSymbolsLabel.text = "Password must be at least 8 symbols"
        createPasswordTextField.placeholder = "Create Password"
        registerUserButton.setTitle("Register", for: .normal)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let transferViewController = TransferViewController(currentUser: User(username: "", password: "", userAccountBalance: 0.0))
        navigationController?.pushViewController(transferViewController, animated: true)
        userManager.registerUser(username: "", password: "")
    }
}
