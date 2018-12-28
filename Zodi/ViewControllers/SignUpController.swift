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
    @IBOutlet weak var passwordField: UITextField!
    
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
        let name = nameField.text!
        let password = passwordField.text!
        let email = emailField.text!
        let birthdate = birthdateField.text!
        let result = backend_link.signUp(name, password, email, birthdate)
        /*
        let user_check: Int = result.0
        let pass_check: Int = result.1
        let email_check: Int = result.2
        let birth_check: Int = result.3
        
        print("User: " + String(user_check) + " -- Pass: " + String(pass_check) + " -- Email: " + String(email_check) + " -- Birth: " + String(birth_check))
        */
        
        //let alert = UIAlertController(title: "Error", message: "Failed to retrieve response from server.", preferredStyle: UIAlertController.Style.alert)
        // self.present(alert, animated: true, completion: nil)
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
