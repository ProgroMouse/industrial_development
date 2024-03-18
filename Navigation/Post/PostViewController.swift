//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Viktoria Dolínskaya on 07.11.2023.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post?
    
    init(post: Post) {
           super.init(nibName: nil, bundle: nil)
           self.post = post
       }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .lightGray
        showBarButton()
    }
    
    private func showBarButton () {
        let button  = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = button
        
    }
    @objc private func tapAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
    

