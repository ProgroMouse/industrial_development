//
//  FeedViewController.swift
//  Navigation
//
//  Created by Viktoria Dolínskaya on 12.11.2023.
//

import UIKit

class FeedViewController: UIViewController {
//    private let secondPost = Post(title: "Пост")
    
    private lazy var action1Button: UIButton = {
        let button1 = UIButton()
        button1.setTitle("button1", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.backgroundColor = .systemBlue
        button1.layer.cornerRadius = 4
        button1.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button1.layer.shadowRadius = 4
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOpacity = 0.7
        button1.clipsToBounds = false
        button1.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        
        return button1
    }()
    
    private lazy var action2Button: UIButton = {
        let button2 = UIButton()
        button2.setTitle("button2", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.backgroundColor = .systemBlue
        button2.layer.cornerRadius = 4
        button2.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button2.layer.shadowRadius = 4
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOpacity = 0.7
        button2.clipsToBounds = false
        button2.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        
        return button2
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(self.action1Button)
        stackView.addArrangedSubview(self.action2Button)
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20.0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20.0),
            stackView.centerYAnchor.constraint(equalTo:safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor),
        ])
    }


    @objc private func tapButton1() {
//        let postVC = PostViewController()
//        postVC.post = Post
//        
        navigationController?.pushViewController(self, animated: true)
    }
    @objc private func tapButton2() {
//        let postVC = PostViewController()
       //        postVC.post = Post
        
        navigationController?.pushViewController(self, animated: true)
    }
    }
    

