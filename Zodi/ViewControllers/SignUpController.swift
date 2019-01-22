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
    
    // This is used to inhibit non alpha-numeric values in particular text fields
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
        backend_link.evalUser(name, password, email, birthdate, completion: { validUser in
                if validUser {
                    print("Success, redirect for registration.")
                    backend_link.regUser(name, password, email, birthdate, completion: { registered in
                        if registered {
                            print("Successful Registration!")
                            // self.performSegue(withIdentifier: "getLocation", sender: self)
                        }
                        else {
                            print("Error connecting to server.")
                        }
                    })
                }
                else {
                    print("Error with user inputs or server connection.")
                }
        })

    }

    // Linking location page
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getLocation" {
            if let locationVC = segue.destination as? locationConfig {
                print(locationVC)
            }
        }
    }
     */
    
}


