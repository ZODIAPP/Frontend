//
//  backend.swift
//  Zodi
//
//  Created by Nolan Rudolph on 12/19/18.
//  Copyright © 2018 huynhwav. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

let firstVc = UIViewController()
let nextVC = UIViewController()

class NSAlert : NSObject {}

class backend_link {
    
    /* I struggled for two days with asymetric runtimes (Alamofire.request is an asymetric method which essentially means the rest of your code will run before it is done, which inhibits a .post request from evaluating if a user has submitted proper data and then creating the user in the same method. THEREFORE, I have created two methods: evalUser() which evaluates if the user has provided proper strings for each of the textfields, and regUser() which registers the user if all information abides by the backend, and conversely if the user provides faulty information.
 
     */
    static func evalUser(_ name: String, _ password: String, _ email: String, _ birthdate: String) -> Bool {
        var validUser = false
        
        let parameters: Parameters = [
            "username": name,
            "password": password,
            "email": email,
            "birthdate": birthdate,
        ]

        Alamofire.request("http://localhost:5000/register", method: .get, parameters: parameters).responseString { (response) -> Void in
                if let userAuth = response.result.value {
                    print(userAuth)
                    if userAuth == "true" {
                        validUser = true
                    }
                }
                else {
                    print("Error connecting with server.")
                }
            
        }
        
        if validUser {
            return true
        }
        else {
            return false
        }
    }
    
    static func regUser(_ name: String, _ password: String, _ email: String, _ birthdate: String) -> Bool {
        
        var serverResponse = false
        
        let parameters: Parameters = [
            "username": name,
            "password": password,
            "email": email,
            "birthdate": birthdate,
            ]
        
        Alamofire.request("http://localhost:5000/register", method: .post, parameters: parameters).responseString { (response) -> Void in
            if response.result.value != nil {
                serverResponse = true
            }
        }
        
        if serverResponse {
            return true
        }
        else {
            return false
        }
    }
}


