//
//  LoginViewController.swift
//  Exposure
//
//  Created by J.M.B. Ruchtie on 15/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    
    private let usernameEmailField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0 , y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        
        field.placeholder = "Password"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0 , y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        
        return field
    }()
    

    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .secondarySystemBackground
    
        return button
    }()
    
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIView()
        header.addSubview(backgroundImageView)
        header.backgroundColor = .systemBackground
         
        return header
        
    }()
    
    
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
 
    
        return button
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .systemBackground
        
        //asign frames
        
        headerView.frame = CGRect(x: 0,
                                  y:view.safeAreaInsets.top,
                                  width: view.width,
                                  height: view.height/3.0)
        configureHeaderView()
        }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
    
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        // Add logo
        let imageView = UIImageView(image: UIImage(named:"logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
         
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        
        
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton(){}
    
    @objc private func didTapTermsButton(){}
    
    @objc private func didTapPrivacyButton(){}
    
    @objc private func didTapCreateAccpountButton(){}

    

}
