//
//  ItemInfoView.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 25/02/2022.
//

import UIKit


class ItemInfoView: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    
    let itemViewOne: Item = {
        let item = Item(frame: .zero)
        item.translatesAutoresizingMaskIntoConstraints = false

        return item
    }()
    
    let itemViewTwo: Item = {
        let item = Item(frame: .zero)
        item.translatesAutoresizingMaskIntoConstraints = false

        return item
    }()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        self.addSubview(itemViewOne)
        self.addSubview(itemViewTwo)
        self.addSubview(button)
        
        applyConstraints()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func applyConstraints() {
        
        let itemViewOneConstraints = [
            itemViewOne.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemViewOne.topAnchor.constraint(equalTo: self.topAnchor),
            itemViewOne.widthAnchor.constraint(equalToConstant: self.bounds.width / 2),
            itemViewOne.heightAnchor.constraint(equalToConstant: 80),
        ]
        
        let itemViewTwoConstraints = [
            itemViewTwo.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            itemViewTwo.topAnchor.constraint(equalTo: self.topAnchor),
            itemViewTwo.widthAnchor.constraint(equalToConstant: self.bounds.width / 2),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 80)

        ]

        let buttonConstraints = [
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        
        NSLayoutConstraint.activate(itemViewOneConstraints)
        NSLayoutConstraint.activate(itemViewTwoConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
}


