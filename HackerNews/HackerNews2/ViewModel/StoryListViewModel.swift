//
//  StoryListViewModel.swift
//  HackerNews2
//
//  Created by Mayuresh Rao on 12/10/20.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        self.cancellable = WebService().getAllTopStories().map {
            storyIds in storyIds.map { StoryViewModel(id: $0)}
        }.sink(receiveCompletion: {_ in }, receiveValue: {
            storyViewModels in
            self.stories = storyViewModels
        })
    }
}


struct StoryViewModel {
    let id: Int
}
