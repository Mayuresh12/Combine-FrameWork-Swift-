//
//  WebService.swift
//  combineForNetwork
//
//  Created by Mayuresh Rao on 11/24/20.
//

import Foundation
import Combine

class WebService {
    
    let url = "https://jsonplaceholder.typicode.com/posts"
    
    func getPosts () -> AnyPublisher<[Post], Error> {
        guard let url = URL(string: url) else {
            fatalError("invalid String")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map{ $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
