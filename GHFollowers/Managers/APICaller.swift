//
//  APICaller.swift
//  GHFollowers
//
//  Created by Ibrahim Abdul Aziz on 21/02/2022.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}

struct Constants {
    static let base_URL = "https://api.github.com"
}

class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    func getFollowers(login: String, completion: @escaping (Result<[Follower]?, Error>) -> Void) {
        guard let login = login.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        guard let url = URL(string: "\(Constants.base_URL)/users/\(login)/followers") else {
            print("Invalid search URL")
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode([Follower].self, from: data)
                completion(.success(results))
                print(results)
            }
            catch {
                completion(.failure(APIError.failedToGetData))
                print("Fuck it")
                print(error)
            }
        }
        task.resume()

    }
    
    
    func getUser(login: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.base_URL)/users/\(login)") else {
            print("Invalid user URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(User.self, from: data)
                completion(.success(results))
                print(results)
            }
            catch {
                completion(.failure(error))
                print("Not Working, man")
                print(error)
            }
        }
        task.resume()
        
    }
    
    
}
