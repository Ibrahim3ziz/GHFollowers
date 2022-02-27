//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 21/02/2022.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let identifier = "FollowerCollectionViewCell"
    
    private let avatarImageView: UIImageView = {
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
//        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
//        label.backgroundColor = .blue
        return label
    }()
    
    private func applyConstraints() {
        
        let avatarImageViewConstraints = [
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ]
        
        let usernameLabelConstraints = [
            loginLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 6),
            loginLabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            loginLabel.heightAnchor.constraint(equalToConstant: 18),
            loginLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width)
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
    }
    
    public func configureCell(with model: FollowerViewModel) {
        avatarImageView.loadFrom(URLAddress: model.avatar_url)
        loginLabel.text = model.login
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(loginLabel)
        contentView.backgroundColor = .systemBackground
        applyConstraints()
    }
 

    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

