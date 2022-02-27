//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 20/02/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var followers = [Follower]()
    
    private let gitHubImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size = CGSize(width: 50, height: 50)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "gh-logo")
        
        return imageView
    }()
    
    private let userNameTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.placeholder = "Enter a username"
        textField.textAlignment = .center
        textField.textColor = .systemGray2
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        
        
        return textField
    }()
    
    private let getFollowersButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Followers", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.addTarget(self, action: #selector(getFollowersButtonTap), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(gitHubImageView)
        view.addSubview(userNameTextField)
        view.addSubview(getFollowersButton)
        applyConstraints()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated : true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    @objc private func getFollowersButtonTap() {
        getFollowers()
    }
    
    
    private func getFollowers() {
        let followersVc = FollowersListViewController()
        APICaller.shared.getFollowers(login: userNameTextField.text ?? "") { [weak self] result in
            switch result {
            case.success(let followers):
                DispatchQueue.main.async {
                    if followers?.count != 0 {
                        followersVc.followers = followers ?? []
                        followersVc.title = self?.userNameTextField.text
                    } else {
                        
                        print("user has no followers")
                    }
                    self?.navigationController?.pushViewController(followersVc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    private func applyConstraints() {
        let gitHubImageViewConstraints = [
            gitHubImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            gitHubImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gitHubImageView.widthAnchor.constraint(equalToConstant: 200),
            gitHubImageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let userNameTextFieldConstraints = [
            userNameTextField.topAnchor.constraint(equalTo: gitHubImageView.bottomAnchor, constant: 30),
            userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let getFollowersButtonConstraints = [
            getFollowersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            getFollowersButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60),
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(gitHubImageViewConstraints)
        NSLayoutConstraint.activate(userNameTextFieldConstraints)
        NSLayoutConstraint.activate(getFollowersButtonConstraints)
    }
    


}
