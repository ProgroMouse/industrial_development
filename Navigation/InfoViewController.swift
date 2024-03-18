//
//  InfoViewController.swift
//  Navigation
//
//  Created by Viktoria Dolínskaya on 01.12.2023.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать INFO", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(actionButton)
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20.0),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20.0),
            actionButton.centerYAnchor.constraint(equalTo:safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "", message: "Информация была полезна?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Да!", style: .default) {
            _ in self.dismiss(animated: true)
            print("Спасибо за инфо)")
        }
        let cancel = UIAlertAction(title: "Нет", style: .destructive) {
            _ in print("Всего доброго!")
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}


