//
//  SignUpController.swift
//  Zodi
//
//  Created by Vince Huynh on 12/16/18.
//  Copyright © 2018 huynhwav. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, UITextFieldDelegate {
    //IBOutlets are interface builder outlets which will take the input from the interface and allow the SignUpController object to then send the fields as a request to the server
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var birthdateField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var blankFieldError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        blankFieldError.isHidden = true
        //
        self.nameField.delegate = self
        
    }
    
    
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowChar = CharacterSet.letters
        let charSet = CharacterSet(charactersIn: string)
        return allowChar.isSuperset(of: charSet)
    }
    */
    
    
    @IBAction func submitBtn_pressed(_ sender: Any) {
        let check = blankChecker()
        let name = check.0
        let email = check.1
        let birthdate = check.2
        
        if !name || !email || !birthdate {
            blankFieldError.isHidden = false
            let red = UIColor.red
            if !name {
                nameField.layer.borderColor = red.cgColor
                nameField.layer.borderWidth = 1.5
            }
            if !email {
                emailField.layer.borderColor = red.cgColor
                emailField.layer.borderWidth = 1.5
            }
            if !birthdate {
                birthdateField.layer.borderColor = red.cgColor
                birthdateField.layer.borderWidth = 1.5
            }
            return
        }
        
        backend_link.signUp("Nolan", "nolanr@yes.com", "08/25/1998")
        
    }
    
    func blankChecker() -> (name: Bool, email: Bool, birthdate: Bool){
        //This will be used in the loginHandler to error check whether or not the user has given input or not so as to assure correct requests to the API
        var name = true
        var email = true
        var birthdate = true
        if nameField.text == "" {
            name = false
        }
        if emailField.text == "" {
            email = false
        }
        if birthdateField.text == "" {
            birthdate = false
        }
        
        return (name, email, birthdate)
    }
    
    func validChecker() {
        //this will be used by the loginHandler to ensure that input is valid so that only valid requests are sent to the server
        
    }
    
    func loginHandler() {
        //This will take the input from the IBOutlets and make requests to the RESTful api using Alamofire (probably)
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
