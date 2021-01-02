//
//  ContentView.swift
//  TwitterSlideMenu
//
//  Created by 中筋淳朗 on 2020/11/12.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @State var menuWidth = UIScreen.main.bounds.width - 90
    // x = 0 のときサイドメニューが表示される
    @State var x = -(UIScreen.main.bounds.width - 90)
    
    @State var show = true
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            // MARK: - Background
            HomeView(x: $x)
            
            // MARK: - Side Menu Shadow
            //サイドメニューに合わせてopacityを変える 0 ~ 0.4
            let menuOpacity = 0.4 - Double(0.4 / menuWidth * (-x))
            
            Color.black.opacity(x == -menuWidth ? 0 : menuOpacity).ignoresSafeArea()
                .onTapGesture(perform: {
                    withAnimation {
                        x = -menuWidth
                    }
                })
            
            
            // MARK: - Slide Menu
            SlideMenu()
                .offset(x: x)
        } //: ZStack
        .gesture(
            DragGesture()
                .onChanged({ (value) in
                    withAnimation {
                        if value.translation.width > 0 { // 右スライドの場合
                            x = -menuWidth + value.translation.width
                        } else { // 左スライドの場合
                            x = value.translation.width
                        }
                    }
                })
                .onEnded({ (value) in
                    withAnimation {
                        if value.translation.width > 0 { // 右スライドの場合
                            x = 0
                        } else { // 左スライドの場合
                            x = -menuWidth
                        }
                    }
                })
        )
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
