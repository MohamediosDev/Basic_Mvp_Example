//
//  LoginVcPresenter.swift
//  MvpExample
//
//  Created by Mohamed on 1/10/21.
//

import Foundation

protocol LoginVcDelegate {
    func showErrorMessage(message:String)
    func userSuccessLogin()
}

class LoginPresenter: NSObject {
    
    var loginVcDelegate:LoginVcDelegate!
    
    
    func validateData(userName:String , passWord:String){
        
        if userName.count != 0 {
            
            if passWord.count != 0 {
                verifyLogin(username: userName, password: passWord)
            }
            
            else {
                
                self.loginVcDelegate.showErrorMessage(message: "passWord Shoudn't be not empty")
            }
            
        verifyLogin(username: userName, password: passWord)
        }
        
        else {
            self.loginVcDelegate.showErrorMessage(message: "username Shoudn't be not empty")
        }
        
      
        
    }
    
    
    fileprivate func verifyLogin(username:String,password:String) {
        
        if username == "test" && password == "123456" {
            
            let user = UserModel(name: "test", email: "test@test.com", gender: "Male")
            self.loginVcDelegate.userSuccessLogin()
        }
        else {
            self.loginVcDelegate.showErrorMessage(message: "incorrect password or username")
        }
    }
}
