//
//  ViewController.swift
//  Exposure
//
//  Created by J.M.B. Ruchtie on 15/04/2022.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handelNotAhtehnticated()
        }

    
    
    private func handelNotAhtehnticated(){
        //Check auth status
        if Auth.auth().currentUser == nil{
        //Show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
    
        }
    }
 
}

