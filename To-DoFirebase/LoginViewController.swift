//
//  ViewController.swift
//  To-DoFirebase
//
//  Created by Danya on 23.09.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warnLabel.alpha = 0
        
        Auth.auth().addStateDidChangeListener( { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: "MainSegue", sender: nil)
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginTF.text = ""
        passwordTF.text = ""
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        guard let login = loginTF.text, let password = passwordTF.text, login != "", password != "" else {
            displayWarningLabel(withText: "Info is incorect")
            return
        }
        
        Auth.auth().signIn(withEmail: login, password: password, completion: { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "Error occured")
                return
            }
            
            if user != nil {
                self?.performSegue(withIdentifier: "MainSegue", sender: nil)
                return
            }
            self?.displayWarningLabel(withText: "No such user")
        })
    }
    
    func displayWarningLabel(withText text: String) {
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseIn,
                       animations: {[weak self] in
                        self?.warnLabel.alpha = 1
                       }) { [weak self] complite in
            self?.warnLabel.alpha = 1
        }
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        guard let login = loginTF.text, let password = passwordTF.text, login != "", password != "" else {
            displayWarningLabel(withText: "Info is incorect")
            return
        }
        
        Auth.auth().createUser(withEmail: login, password: password) { (user, error) in
            if error == nil {
                if user != nil {
                    
                } else {
                    print("user is not created")
                }
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }

    //скрыть клавиатуру по нажатию
    @IBAction func tapGR(_ sender: UITapGestureRecognizer) {
        loginTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
}
