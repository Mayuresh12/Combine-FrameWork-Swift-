//
//  StoryDetailView.swift
//  HackerNews2
//
//  Created by Mayuresh Rao on 12/10/20.
//

import SwiftUI

struct StoryDetailView: View {
    
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    
    init(storyId: Int) {
        self.storyDetailVM = StoryDetailViewModel(storyId: storyId)
        
    }
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
