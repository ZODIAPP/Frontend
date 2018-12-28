//
//  backend.swift
//  Zodi
//
//  Created by Nolan Rudolph on 12/19/18.
//  Copyright © 2018 huynhwav. All rights reserved.
//

import Foundation
import Alamofire

class NSAlert : NSObject {}

class backend_link {
    static func signUp(_ name: String, _ password: String, _ email: String, _ birthdate: String) {
        let parameters: Parameters = [
            "username": name,
            "password": password,
            "email": email,
            "birthdate": birthdate
        ]
        
        var data: NSDictionary = NSDictionary()
        
        Alamofire.request("http://localhost:5000/register", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            data = response.result.value as! NSDictionary
            print("Jesus")
            print(data)
            print("Do i get soemthing doei")
        }
        print("How fucked?")
        print(data)
        print("Okay hello")
        /*
        return (data["username"] as! Int, data["password"] as! Int, data["email"] as! Int, data["birthdate"] as! Int)
        */
    }
}
