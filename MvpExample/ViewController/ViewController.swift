//
//  ViewController.swift
//  MvpExample
//
//  Created by Mohamed on 1/10/21.
//

import UIKit

class ViewController: UIViewController,LoginVcDelegate {
   
    
    
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    var presenter:LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        presenter = LoginPresenter()
        presenter.loginVcDelegate = self
    }
    
    //MARK:- Delegate Methods
    
    func showErrorMessage(message: String) {
        errorLabel.textColor = .red
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func userSuccessLogin() {
        errorLabel.textColor = .green
        errorLabel.text = "Successfully Login"
        errorLabel.isHidden = false
    }
    
    //MARK:- IBActions
    
    @IBAction func loginButtonAction(_ sender: Any) {
        errorLabel.isHidden = true
        self.presenter.validateData(userName: userText.text!, passWord: passText.text!)
    }
    
    
    

}

