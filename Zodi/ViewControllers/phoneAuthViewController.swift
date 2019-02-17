//
//  phoneAuthViewController.swift
//  Zodi
//
//  Created by Nolan Rudolph on 2/9/19.
//  Copyright © 2019 huynhwav. All rights reserved.
//

import UIKit
import FirebaseAuth

class phoneAuthViewController: UIViewController {
    @IBOutlet weak var phoneNum: UITextField!
    
    @IBAction func sendCode(_ sender: Any) {
        let alert = UIAlertController(title: "Phone number", message: "Is this your phone number? \n (phoneNum.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) {(UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNum.text!, uiDelegate: nil) {(verificationID, error) in
                if error != nil {
                    print("error\(String(describing: error?.localizedDescription))")
                } else {
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "code", sender: Any?.self)
                }
            }
        }
        let cancel = UIAlertAction(title:"No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
