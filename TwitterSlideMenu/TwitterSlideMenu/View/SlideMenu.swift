//
//  SlideMenu.swift
//  TwitterSlideMenu
//
//  Created by 中筋淳朗 on 2020/11/12.
//

import SwiftUI

struct SlideMenu: View {
    
    // MARK: - Property
    
    var screen = UIScreen.main.bounds
    var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]
    
    @State var show = true
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            
            // MARK: - Icon Image
            Image("logo")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            // MARK: - User Info
            HStack (alignment: .top, spacing: 12) {
                VStack (alignment: .leading, spacing: 12) {
                    Text("I am Cat")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("@IAmCat")
                        .foregroundColor(.gray)
                    
                    // MARK: - Follow Info
                    HStack (spacing: 14) {
                        FollowView(count: 127, title: "Following")
                        FollowView(count: 683, title: "Followers")
                    } //: HStack
                    .padding(.top, 10)
                } //: VStack
                
                Spacer()
                
                // MARK: - Disclosure Button
                Button(action: {
                    withAnimation {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: show ? "chevron.right" : "chevron.down")
                        .foregroundColor(.gray)
                })
                
            } //: HStack
            
            Divider()
                .padding(.top)
            
            // MARK: - Show Menu List
            VStack (alignment: .leading) {
                ForEach(menuButtons, id: \.self) { menu in
                    Button(action: {}, label: {
                        MenuButton(title: menu)
                    })
                }
                
                Group {
                    Divider()
                    
                    Button(action: {}, label: {
                        MenuButton(title: "Twitter Ads")
                    })
                    
                    Divider()
                }
                
                VStack (alignment: .leading, spacing: 20) {
                    Button(action: {}, label: {
                        Text("Settings and privacy")
                            .foregroundColor(.black)
                    })
                    Button(action: {}, label: {
                        Text("Help center")
                            .foregroundColor(.black)
                    })
                } //: VStack
                .padding(.top, 10)
                
                Spacer()
                
                // MARK: - Bottom Buttons
                Divider()
                    .padding(.bottom)
                
                HStack (spacing: 20) {
                    Button(action: {}, label: {
                        Image("help")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.gray)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image("barcode")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.gray)
                    })
                } //: HStack
            } //: VStack
                .opacity(show ? 1 : 0)
                .frame(height: show ? nil : 0)
            
            // MARK: - Hide Menu List
            VStack (alignment: .leading, spacing: 6) {
                Button(action: {}, label: {
                    Text("Create a new account")
                })
                Button(action: {}, label: {
                    Text("Add an existing account")
                })
                Spacer()
            } //: VStack
            .opacity(show ? 0 : 1)
            .frame(height: show ? 0 : nil)
            
        } //: VStack
        .padding(.horizontal, 20)
        .padding(.vertical)
        .frame(width: screen.width - 90)
        .background(Color.white.ignoresSafeArea())
    }
}

// MARK: - Preview

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
