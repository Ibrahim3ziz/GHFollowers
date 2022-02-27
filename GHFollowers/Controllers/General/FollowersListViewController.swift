//
//  FollowersListViewController.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 21/02/2022.
//

import UIKit

struct Constant {
    static let itemSizeWidth: CGFloat = UIScreen.main.bounds.width / 3 - 10
}



class FollowersListViewController: UIViewController {
    
    public var followers = [Follower]()
    
    private let followerCollectionView: UICollectionView = {
        
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Constant.itemSizeWidth, height: 100)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = .zero

        let collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecionView.backgroundColor = .systemBackground
        collecionView.backgroundView?.clipsToBounds = true

        collecionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
        
        return collecionView
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.addSubview(followerCollectionView)
        followerCollectionView.delegate = self
        followerCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        followerCollectionView.frame = view.bounds
    }

}




extension FollowersListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as? FollowerCell else { return UICollectionViewCell() }
        
        let follower = followers[indexPath.row]
        cell.configureCell(with: FollowerViewModel(login: follower.login, avatar_url: follower.avatar_url))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let follower = followers[indexPath.row]
        
        APICaller.shared.getUser(login: follower.login) { [weak self] result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    let userVC = UserInfoViewController()
                    
                    userVC.configUser(with: UserViewModel(login: user.login, avatar_url: user.avatar_url, name: user.name, gitHubProfile: user.gitHubProfile, location: user.location, bio: user.bio, followers_url: user.followers_url, created_at: user.created_at, public_repos: user.public_repos, public_gists: user.public_gists, followers: user.followers, following: user.following))
                    
                    self?.navigationController?.pushViewController(userVC, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
