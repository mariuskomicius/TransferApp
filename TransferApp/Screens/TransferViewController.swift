//
//  TransferViewController.swift
//  TransferApp
//
//  Created by Marius on 2023-08-03.
//
// 4. In home scene we can see user balance (in a label), two input fields, transfer button and logout button (in total, 5 UI elements)
// 5. In those input fields user can enter how much money he is going to transfer and for which user
import UIKit

class TransferViewController: UIViewController {
    
    let userManager = UserManager(users: [], currentUser: (User(username: "", password: "")), registeredUsers: [])
    
    @IBOutlet weak var userBalanceLabel: UILabel!
    @IBOutlet weak var enterAmountTextField: UITextField!
    @IBOutlet weak var enterReceiversUsernameTextField: UITextField!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        userBalanceLabel.text = "User Balance"
        enterAmountTextField.placeholder = "Enter amount to transfer"
        enterReceiversUsernameTextField.placeholder = "Enter receivers username"
        transferButton.setTitle("Transfer", for: .normal)
        logoutButton.setTitle("Logout", for: .normal)
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        let loginViewController = LoginViewController(userManager: userManager)
        navigationController?.pushViewController(loginViewController, animated: true)
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
