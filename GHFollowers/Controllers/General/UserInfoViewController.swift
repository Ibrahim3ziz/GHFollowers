//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 24/02/2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.addSubview(contentView)
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
       let contetnView = UIView()
        contetnView.translatesAutoresizingMaskIntoConstraints = false
        contetnView.addSubview(userImageView)
        contetnView.addSubview(loginLabel)
        contetnView.addSubview(usernameLabel)
        contetnView.addSubview(locationLabel)
        contetnView.addSubview(bioLabel)
        contetnView.addSubview(gitHubProfileCustomView)
        contetnView.addSubview(getFollowersCustomView)
        contetnView.addSubview(creataionLabel)

        return contetnView
    }()
    
    private let userImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.adjustsFontSizeToFitWidth = true
        
        label.text = "Login LABEL"
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "username LABEL"
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "LOCATION"
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
        
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Here is a bio "
        label.textAlignment = NSTextAlignment.justified
        label.textColor = .gray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
    
    private let gitHubProfileCustomView: ItemInfoView = {
        let customView = ItemInfoView(frame: .zero)
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        customView.itemViewOne.setCustomView(itemInfoType: .repos, with: 100)
        customView.itemViewTwo.setCustomView(itemInfoType: .gists, with: 200)
        
        customView.layer.cornerRadius = 12
        customView.button.backgroundColor = .systemPurple
        customView.button.setTitle("GitHub Profile", for: .normal)

        return customView
    }()
    
    private let getFollowersCustomView: ItemInfoView = {
        let customView = ItemInfoView(frame: .zero)
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        customView.itemViewOne.setCustomView(itemInfoType: .following, with: 100)
        customView.itemViewTwo.setCustomView(itemInfoType: .followers, with: 200)
        
        customView.layer.cornerRadius = 12
        customView.button.backgroundColor = .systemGreen
        customView.button.setTitle("Get Followers", for: .normal)
        
        return customView
    }()
    
    private let creataionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "GitHub since Jan 2015"
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)

        applyConstraints()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    public func configUser(with model: UserViewModel) {
        userImageView.loadFrom(URLAddress: model.avatar_url)
        loginLabel.text = model.login
        usernameLabel.text = model.name
        locationLabel.text = model.location
        
        if model.bio == nil {
            bioLabel.text = "There is no bio"
        } else {
            bioLabel.text = model.bio
        }
        
        gitHubProfileCustomView.itemViewOne.countLabel.text = String(model.public_repos)
        gitHubProfileCustomView.itemViewTwo.countLabel.text = String(model.public_gists)
        getFollowersCustomView.itemViewTwo.countLabel.text = String(model.following)
        getFollowersCustomView.itemViewTwo.countLabel.text = String(model.followers)
        creataionLabel.text = "GitHub since \(model.created_at)"
        
    }
    
    
    private func applyConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ]
        
        let userImageViewConstrainst = [
            userImageView.widthAnchor.constraint(equalToConstant: 120),
            userImageView.heightAnchor.constraint(equalToConstant: 120),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20)
        ]
        
        let loginLabelConstraints = [
            loginLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            loginLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20),
            loginLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 14)
        ]
        
        let locationLabelConstraints = [
            locationLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            locationLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 14)
        ]
        
        let bioLabelConstraints = [
            bioLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 14),
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            bioLabel.heightAnchor.constraint(equalToConstant: 75)
            bioLabel.bottomAnchor.constraint(equalTo: gitHubProfileCustomView.topAnchor, constant: -30)
        ]
        
        let gitHubProfilecustomViewConstraints = [
            gitHubProfileCustomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gitHubProfileCustomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            gitHubProfileCustomView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 30),
            gitHubProfileCustomView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let getFollowersCustomViewConstraints = [
            getFollowersCustomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            getFollowersCustomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            getFollowersCustomView.topAnchor.constraint(equalTo: gitHubProfileCustomView.bottomAnchor, constant: 15),
            getFollowersCustomView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let creationLabelConstraints = [
            creataionLabel.topAnchor.constraint(equalTo: getFollowersCustomView.bottomAnchor, constant: 20),
            creataionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            creataionLabel.heightAnchor.constraint(equalToConstant: 25),
            creataionLabel.widthAnchor.constraint(equalToConstant: 220)
        ]
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
            contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
            contentViewHeight.priority = .defaultLow
            
        NSLayoutConstraint.activate([
                contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                contentViewCenterY,
                contentViewHeight
            ])
        
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(contentViewConstraints)
        NSLayoutConstraint.activate(userImageViewConstrainst)
        NSLayoutConstraint.activate(loginLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(locationLabelConstraints)
        NSLayoutConstraint.activate(bioLabelConstraints)
        NSLayoutConstraint.activate(gitHubProfilecustomViewConstraints)
        NSLayoutConstraint.activate(getFollowersCustomViewConstraints)
        NSLayoutConstraint.activate(creationLabelConstraints)
    }
    
    

}
