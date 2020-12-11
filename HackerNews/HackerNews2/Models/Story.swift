//
//  Story.swift
//  HackerNews2
//
//  Created by Mayuresh Rao on 12/10/20.
//

import Foundation

struct Story: Codable {
    let id: Int
    let title: String
    let url: String
}

extension Story {
    
    static func placeholder() -> Story {
        return Story(id: 0, title: "N/A", url: "")
    }
}
