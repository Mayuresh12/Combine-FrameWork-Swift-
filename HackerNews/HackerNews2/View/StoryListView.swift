//
//  StoryListView.swift
//  HackerNews2
//
//  Created by Mayuresh Rao on 12/10/20.
//

import SwiftUI
import Combine

struct StoryListView: View {
    @ObservedObject private var storyListVM = StoryListViewModel()
    var body: some View {
        NavigationView {
            List(self.storyListVM.stories, id: \.id) { storyVM in
                NavigationLink( destination:
                                    StoryDetailView(storyId: storyVM.id)){
                        Text("\(storyVM.id)")
                    }
            }
            .navigationBarTitle("Hacker News")
        }
        
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
