//
//  Home.swift
//  UI-230(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/10.
//

import SwiftUI

struct Home: View {
    @State var slectedTab = "Home"
    @State var showMenu = false
    var body: some View {
        AdaptableStack(showMenu: $showMenu) {
         
            
            MainContet(showMenu: $showMenu)
            
        } menuView: {
            
            SlideView(selectedTab: $slectedTab)
            
        } sideView: {
            
            SideView()
            
        }

       
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View{
    
    
    func getRect()->CGRect{
        
        #if os(macOS)
        return NSScreen.main!.visibleFrame
        #else
        return UIScreen.main.bounds
        #endif
        
        
    }
    
    func isMacOS()->Bool{
        
        #if os(iOS)
        
        return false
        #else
        
        return true
        #endif
        
        
    }
}


struct AdaptableStack<Content : View,MenuView : View,SideView : View> : View {
    
    var content : Content
    var menuView : MenuView
    var sideView : SideView
    @Binding var showMenu : Bool
    
    init(showMenu : Binding<Bool>,@ViewBuilder content : @escaping()->Content,@ViewBuilder menuView : @escaping()->MenuView,@ViewBuilder sideView : @escaping()->SideView) {
        
        
        self.content = content()
        self.menuView = menuView()
        self.sideView = sideView()
        self._showMenu = showMenu
        
    }
    
    
    var body: some View{
        
        
      
        
        
        
        ZStack{
            
            
            #if os(iOS)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack{
                    
                    
                    content
                    
                    sideView
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .background(Color("gray").ignoresSafeArea())
                .overlay(
                
                menuView
                    .clipped()
                    .frame(width:getRect().width / 1.6)
                   
                    .background(Color("gray").ignoresSafeArea())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .offset(x: showMenu ? 0 : -getRect().width)
                    .background(Color.black.opacity(0.3)
                                    
                                    .ignoresSafeArea()
                                    .opacity(showMenu ? 0.35 : 0)
                                    .onTapGesture {
                                        showMenu.toggle()
                                    }
                    )
                    
                  
                
                )
                
                
                
                
            }
            
            
            #else
            
            
            HStack{
                
                
                menuView
                    .frame(width: 220)
                   
                    .background(Color("gray").ignoresSafeArea())
                   
                
                content
                
                
                
               
                
                sideView
                    
                
                
                
            }
            .frame(width: getRect().width / 1.6, height: getRect().height - 100, alignment: .leading)
            .background(Color.white.ignoresSafeArea())
            .buttonStyle(PlainButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
            
            
            
            #endif
            
            
            
            
        }
       
        .preferredColorScheme(.light)
    }
}
