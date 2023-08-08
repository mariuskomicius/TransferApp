//
//  TransferViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//
import UIKit

class TransferViewController: UIViewController {
    
    var users: [User] = []
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
      //  updateUserBalanceLabel()
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
            transferMoney(from: currentUser, to: recipient, amount: amount)
            updateUserBalanceLabel()
        } else {
            showAlert(message: "Incorrect name or negative amount")
        }
    }
    
    enum TransferResult {
        case success
        case failure(String)
    }
    
    func transferMoney(from sender: User, to recipientUsername: String, amount: Double) -> TransferResult {
        guard let recipient = users.first(where: { $0.username == enterRecipientsUsernameTextField.text }),
              amount > 0,
              sender.userAccountBalance >= amount else {
            return .failure("Invalid transfer request")
        }
        
        sender.userAccountBalance -= amount
        recipient.userAccountBalance += amount
        
        
        return .success
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
        userBalanceLabel.text = "Your balance: \(currentUser.userAccountBalance)"
    }
}
