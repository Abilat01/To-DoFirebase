//
//  ViewController.swift
//  To-DoFirebase
//
//  Created by Danya on 23.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
    }
    
    //скрыть клавиатуру по нажатию
    @IBAction func tapGR(_ sender: UITapGestureRecognizer) {
        loginTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
}

