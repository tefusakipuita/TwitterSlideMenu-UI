//
//  MenuButtons.swift
//  TwitterSlideMenu
//
//  Created by 中筋淳朗 on 2020/11/12.
//

import SwiftUI

struct MenuButton: View {
    
    // MARK: - Property
    
    var title: String
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 15) {
            Image(title)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(title)
            
            Spacer()
        } //: HStack
        .foregroundColor(.black)
        .padding(.vertical, 12)
    }
}

// MARK: - Preview

struct MenuButtons_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
