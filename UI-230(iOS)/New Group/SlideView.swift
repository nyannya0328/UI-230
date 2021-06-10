//
//  SlideView.swift
//  UI-230(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/10.
//

import SwiftUI

struct SlideView: View {
    @Binding var selectedTab : String
    @Namespace var animation
    var body: some View {
        VStack{
            
            
            HStack(spacing:10){
                
                
                Text("Files")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
            
                Text("GO")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color("blue"))
                    .cornerRadius(10)
            }
            .padding(10)
            
            Divider()
                .background(Color.black.opacity(0.3))
            
            
            HStack(spacing:10){
                
                
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                Text("Hi King")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.blue)
                    .kerning(1.3)
                
                
            }
            
            VStack(spacing:15){
            
                slidTabButton(title: "Home", image: "house.fill", selectedTab: $selectedTab, animation: animation)
                
                slidTabButton(title: "Shared File", image: "folder.fill.badge.person.crop", selectedTab: $selectedTab, animation: animation)
                
                slidTabButton(title: "Statics", image: "star", selectedTab: $selectedTab, animation: animation)
                
                slidTabButton(title: "Settings", image: "waveform.path.ecg.rectangle.fill", selectedTab: $selectedTab, animation: animation)
                
                slidTabButton(title: "Log Out", image: "rectangle.righthalf.inset.fill.arrow.right", selectedTab: .constant(""), animation: animation)
                
                
            }
            .padding(.leading,20)
            .offset(x: 10)
            .padding(.bottom)
            
            
            
        }
        .frame(width: 220)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color("gray").ignoresSafeArea())
        
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct slidTabButton : View {
    var title : String
    var image : String
    @Binding var selectedTab : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            
            withAnimation{
                
                
                selectedTab = title
            }
            
        }, label: {
            HStack{
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selectedTab == title ? .blue : .black)
                
                
                 Text(title)
                    .font(.title3)
                    .foregroundColor(.green)
                
                
                
                
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
            
                ZStack{
                    
                    
                    
                    if selectedTab == title{
                        
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                    else{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.clear)
                        
                    }
                    
                }
            
            
            )
            .contentShape(Rectangle())
        })
        
        
        
    }
}
