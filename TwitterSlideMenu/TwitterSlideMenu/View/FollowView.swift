//
//  FollowView.swift
//  TwitterSlideMenu
//
//  Created by 中筋淳朗 on 2020/11/12.
//

import SwiftUI

struct FollowView: View {
    
    // MARK: - Property
    
    var count: Int
    var title: String
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("\(count)")
                .fontWeight(.bold)
            Text(title)
                .foregroundColor(.gray)
        } //: HStack
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
