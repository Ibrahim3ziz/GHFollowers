//
//  MainTabBarViewController.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 20/02/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: SearchViewController())
        let vc2 = UINavigationController(rootViewController: FavoriteListViewController())
        
//        vc1.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        vc2.tabBarItem.image = UIImage(systemName: "star")
                
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        vc1.title = "Search"
        vc2.title = "Favorite"
        
        tabBar.tintColor = .systemGreen
        setViewControllers([vc1, vc2], animated: true)

    }
    

  

}
