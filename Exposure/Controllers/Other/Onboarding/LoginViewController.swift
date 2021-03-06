//
//  LoginViewController.swift
//  Exposure
//
//  Created by J.M.B. Ruchtie on 15/04/2022.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIView()
        header.addSubview(backgroundImageView)
        header.backgroundColor = .systemBackground
         
        return header
        
    }()
    
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
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
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        
        field.placeholder = "Password"
        field.returnKeyType = .continue
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
        button.backgroundColor = .red
    
        return button
    }()
    

    

    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
 
        return button
        
    }()
    
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
 
        return button
        
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
 
        return button
        
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)

        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
      
    
        
        addSubviews()
        view.backgroundColor = .systemBackground
        
        //asign frames
        
        headerView.frame = CGRect(x: 0, y:view.safeAreaInsets.top,width: view.width, height: view.height/3.0)
        usernameEmailField.frame = CGRect(x: 25, y:headerView.bottom + 10,width: view.width-50,height: 52.0)
        passwordField.frame = CGRect(x: 25, y:usernameEmailField.bottom + 10,  width: view.width-50, height: 52.0)
        loginButton.frame = CGRect(x: 25,y:passwordField.bottom + 10,width: view.width-50, height: 52.0)
        createAccountButton.frame = CGRect(x: 25,  y:loginButton.bottom + 10, width: view.width-50, height: 52.0)
        termsButton.frame = CGRect(x: 10,  y:view.height-view.safeAreaInsets.bottom-110, width: view.width-50, height: 52.0)
        privacyButton.frame = CGRect(x: 10,  y:view.height-view.safeAreaInsets.bottom-80, width: view.width-50, height: 52.0)


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
//        let imageView = UIImageView(image: UIImage(named:"logo"))
//        headerView.addSubview(imageView)
//        imageView.contentMode = .scaleAspectFit
//        imageView.frame = CGRect(x: headerView.width/4.0,
//                                 y: view.safeAreaInsets.top,
//                                 width: headerView.width/2.0,
//                                 height: headerView.height - view.safeAreaInsets.top)
         
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    

    }
    
    private func addSubviews(){
        
        view.addSubview(headerView)
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)

    }
    
    @objc private func didTapLoginButton(){
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        dismiss(animated: true)
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
                return
        }
        
        //login functionality
                                                    
                                                                      
                                                             

        
    }
    
    
    
    @objc private func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }

    
    
    @objc private func didTapTermsButton(){
        guard let url = URL(string:"https://www.google.nl") else {
            return
        }
        let vc = SFSafariViewController(url:url)
        present(vc, animated:true)
        
    }
    
    @objc private func didTapPrivacyButton(){
        guard let url = URL(string:"https://www.apple.com") else {
            return
        }
        let vc = SFSafariViewController(url:url)
        present(vc, animated:true)
    }
    

    

}




extension  LoginViewController: UITextViewDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}
