//
//  TransferViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//
import UIKit

class TransferViewController: UIViewController {
    
    let userManager = UserManager(users: [], currentUser: (User(username: "", password: "")))
    
    @IBOutlet weak var userBalanceLabel: UILabel!
    @IBOutlet weak var enterAmountTextField: UITextField!
    @IBOutlet weak var enterRecipientsUsernameTextField: UITextField!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        userBalanceLabel.text = "User balance"
        enterAmountTextField.placeholder = "Enter amount to transfer"
        enterRecipientsUsernameTextField.placeholder = "Enter recipients username"
        transferButton.setTitle("Transfer", for: .normal)
        logoutButton.setTitle("Logout", for: .normal)
    }
    
    
    @IBAction func transferButtonTapped(_ sender: Any) {
        if let amountText = enterAmountTextField.text,
            let amount = Double(amountText),
           let recipient = enterRecipientsUsernameTextField.text,
           amount > 0 {
        } else {
            showAlert(message: "Incorrect or negative amount")
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let loginViewController = LoginViewController(userManager: userManager)
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
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
