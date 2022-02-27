//
//  UserViewModel.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 25/02/2022.
//

import Foundation

struct UserViewModel {
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
}
