//
//  HomeView.swift
//  TwitterSlideMenu
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    @Binding var x: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                x = 0
                            }
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        })
                        Spacer()
                    } //: HStack
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    
                    Text("Slide Menu")
                } //: ZStack
                .padding(.top, edge!.top == 0 ? 15 : edge?.top)
                .background(Color.white.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0.0, y: 0))
                
                Spacer()
            } //: VStack
            .ignoresSafeArea()
        } //: ZStack
    }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
