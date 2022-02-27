//
//  User.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 22/02/2022.
//

import Foundation

struct User: Codable {
    let login: String
    let avatar_url: String
    let name: String?
    let gitHubProfile: String
    let location: String?
    let bio: String?
    let followers_url: String
    let created_at: String
    let public_repos: Int
    let public_gists: Int
    let followers: Int
    let following: Int
    
    
    enum CodingKeys: String, CodingKey {
        case gitHubProfile = "html_url"
        case login, avatar_url, name, location, bio, followers_url, created_at, public_repos, public_gists, followers, following
    }
}
