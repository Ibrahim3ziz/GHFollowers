//
//  Item.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 26/02/2022.
//

import UIKit

enum ItemInfoType {
    case repos, gists, following, followers
}

class Item: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(symbolImageView)
        self.addSubview(titleLabel)
        self.addSubview(countLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let symbolImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Public Repos"
        
        return label
    }()
    
    let countLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "300"
        
        return label
    }()
    
    private func applyConstraints() {
        let symbolImageViewOneConstraints = [
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20)
        ]

        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            titleLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width)
        ]

        let countLabelConstraints = [
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            countLabel.centerXAnchor.constraint(equalTo: symbolImageView.centerXAnchor, constant: 50),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            countLabel.widthAnchor.constraint(equalToConstant: countLabel.intrinsicContentSize.width)
        ]

        
        NSLayoutConstraint.activate(symbolImageViewOneConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(countLabelConstraints)
    }
    
    
    public func setCustomView(itemInfoType: ItemInfoType, with count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = UIImage(systemName: "folder")
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = UIImage(systemName: "text.alignleft")
            titleLabel.text = "Public Gists"
        case .following:
            symbolImageView.image = UIImage(systemName: "heart")
            titleLabel.text = "Following"
        case .followers:
            symbolImageView.image = UIImage(systemName: "person.2")
            titleLabel.text = "Followers"
        }
        countLabel.text = String(count)
    }
    
    
}
