//
//  TransferViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//
import UIKit

class TransferViewController: UIViewController {
    
    var currentUser = User(username: "", password: "", userAccountBalance: 0.0)
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userManager = UserManager(users: [], currentUser: (User(username: "", password: "", userAccountBalance: 0.0)))
    
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
        updateUserBalanceLabel()
        //userBalanceLabel.text = "User balance"
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
    
    func updateUserBalanceLabel() {
        userBalanceLabel.text = "Your balance: 200"
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
