//
//  backend.swift
//  Zodi
//
//  Created by Nolan Rudolph on 12/19/18.
//  Copyright © 2018 huynhwav. All rights reserved.
//

import Foundation
import Alamofire

class backend_link {
    static func signUp(_ name: String, _ email: String, _ birthdate: String) {
        print("Sending Request")
        let parameters: Parameters = [
            "username": "Nolan"
        ]
        
        AF.request("http://localhost:5000/register", method: .post, parameters: parameters, encoding: URLEncoding.default).response { response in
                print("Hello!")
            }
    }
}
