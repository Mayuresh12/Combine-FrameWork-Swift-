//
//  WebService.swift
//  HackerNews2
//
//  Created by Mayuresh Rao on 12/10/20.
//

import Foundation
import Combine

class WebService {
    
    
    func getStoryById(storyId: Int) -> AnyPublisher<Story, Error> {
        guard let url  = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(storyId).json?print=pretty") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .catch { _ in Empty<Story, Error>()}
            .eraseToAnyPublisher()
    }
    
    func getAllTopStories() -> AnyPublisher<[Int], Error> {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

