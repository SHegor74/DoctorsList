//
//  DoctorService.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 08.05.2024.
//

import Foundation

enum ApiType {
    case getUsers
    
    var baseUrl: String {
        return "https://api.jsonbin.io/"
    }
    
    var path: String {
        return "v3/b/655b754e0574da7622c94aa4#"
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseUrl)!)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}

protocol UserServiceProtocol {
    func loadUsers(handler: @escaping (Result<[User], Error>) -> Void)
}

struct UserService: UserServiceProtocol {
    
    private let networkClient: NetworkRouting
    private let decoder: JSONDecoder
    
    init(networkClient: NetworkRouting = NetworkClient(), decoder: JSONDecoder = JSONDecoder()) {
        self.networkClient = networkClient
        self.decoder = decoder
    }
    
    func loadUsers(handler: @escaping (Result<[User], Error>) -> Void) {
        networkClient.fetch(request: ApiType.getUsers.request) { result in
            switch result {
            case .success(let data):
                
                do {
                    let userResponse = try decoder.decode(UserResponse.self, from: data)
                    DispatchQueue.main.async {
                        handler(.success(userResponse.record.data.users))
                    }
                } catch {
                    print(error)
                    handler(.failure(error))
                }
                
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
