//
//  AuthManager.swift
//  Exposure
//
//  Created by J.M.B. Ruchtie on 19/04/2022.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // Mark: - public
    
    public func registerNewUser(username: String, email: String, password:String){
        
    }
   
//    public func loginUser(username:String?, email: String?, password: String, completion: ((Bool) -> void)){
//        if let email = email{
//            //email
//            Auth.auth().signIn(withEmail: email, password: password) { autResult, error in
//                guard autResult != nil, error == nil else{
//                    completion(false)
//                    return
//                }
//                completion(true)
//            }
//        }else if let username = username {
//           //username
//            print(username )
//        }
//    }
    
}
