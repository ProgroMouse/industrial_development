//
//  LoginViewController.swift
//  Navigation
//
//  Created by Viktoria Dolínskaya on 12.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    var isBtnSelected: Bool = false
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var iconVK: UIImageView = {
        
        let iconVK = UIImageView()
        iconVK.image = UIImage(named: "AppIcon")
        iconVK.translatesAutoresizingMaskIntoConstraints = false
        iconVK.layer.cornerRadius = 10
        iconVK.layer.masksToBounds = true
        
        return iconVK
    }()
    
    private lazy var emailOrPhoneTextField: UITextField = {
        let emailOrPhoneTextField = UITextField()
        
        emailOrPhoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailOrPhoneTextField.backgroundColor = .systemGray6
        emailOrPhoneTextField.textColor = .black
        emailOrPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailOrPhoneTextField.layer.borderWidth = 0.5
        emailOrPhoneTextField.autocapitalizationType = .none
        emailOrPhoneTextField.placeholder = " Email or phone"
        emailOrPhoneTextField.keyboardType = UIKeyboardType.default
        emailOrPhoneTextField.returnKeyType = UIReturnKeyType.done
        emailOrPhoneTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        //        что меняет тинт колор?
        emailOrPhoneTextField.tintColor = UIColor(named: "AccentColor")
        emailOrPhoneTextField.autocorrectionType = UITextAutocorrectionType.no
        
        return emailOrPhoneTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.textColor = .black
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.placeholder = " Password"
        
        return passwordTextField
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        let bluePixel = UIImage(named: "bluePixel")
        logInButton.setBackgroundImage(bluePixel, for: .normal)
        logInButton.alpha = 0.8
        logInButton.layer.masksToBounds = true
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        logInButton.layer.borderColor = UIColor.lightGray.cgColor
        logInButton.layer.borderWidth = 0.5
        logInButton.layer.cornerRadius = 10
        logInButton.addTarget(self, action: #selector(buttonLogInPressed), for: .touchUpInside)
        
        return logInButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.clipsToBounds = true
        stackView.addArrangedSubview(self.emailOrPhoneTextField)
        stackView.addArrangedSubview(self.passwordTextField)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        addSubviews()
        setupConstraints()
        changeBtn() 
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(iconVK)
        contentView.addSubview(stackView)
        contentView.addSubview(logInButton)
    }
    
    private func setupConstraints() {
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            iconVK.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 120.0),
            iconVK.widthAnchor.constraint(equalToConstant: 100.0),
            iconVK.heightAnchor.constraint(equalToConstant: 100.0),
            iconVK.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16.0),
            
            emailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 50.0),
            emailOrPhoneTextField.topAnchor.constraint(equalTo: iconVK.bottomAnchor,constant: 120.0),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50.0),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 16.0),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16.0),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16.0),
            logInButton.heightAnchor.constraint(equalToConstant: 50.0),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    private func changeBtn() {
        switch logInButton.state {
        case .normal:
            logInButton.alpha = 1
        case .selected:
            logInButton.alpha = 0.8
        case .disabled:
            logInButton.alpha = 0.8
        case .highlighted:
            logInButton.alpha = 0.8
        default:
            logInButton.alpha = 1
        }
    }
    // MARK: - Actions
    @objc func willShowKeyboard(_ notification: NSNotification) {
           let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
           scrollView.contentInset.bottom = keyboardHeight ?? 0.0
       }
       
       @objc func willHideKeyboard(_ notification: NSNotification) {
           scrollView.contentInset.bottom = 0.0
       }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//        убрать навигейшн бар
//            navigationController?.setNavigationBarHidden(true, animated: animated)
            
            setupKeyboardObservers()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            removeKeyboardObservers()
        }
    
    @objc private func buttonLogInPressed() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

}
