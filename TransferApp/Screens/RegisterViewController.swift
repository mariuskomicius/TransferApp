//
//  RegisterViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var welcomeNewUserLabel: UILabel!
    @IBOutlet weak var usernameSymbolsLabel: UILabel!
    @IBOutlet weak var createUsernameTextField: UITextField!
    @IBOutlet weak var passwordSymbolsLabel: UILabel!
    @IBOutlet weak var createPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var registerUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        welcomeNewUserLabel.text = "Welcome, new User"
        usernameSymbolsLabel.text = "Username must be at least 8 symbols"
        createUsernameTextField.placeholder = "Create Username"
        passwordSymbolsLabel.text = "Password must be at least 8 symbols"
        createPasswordTextField.placeholder = "Create Password"
        repeatPasswordTextField.placeholder = "Repeat Password"
        registerUserButton.setTitle("Register", for: .normal)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let transferViewController = TransferViewController()
        if createUsernameTextField.text == "123",
           createPasswordTextField.text == "123",
           repeatPasswordTextField.text == "123" {
        };navigationController?.pushViewController(transferViewController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
