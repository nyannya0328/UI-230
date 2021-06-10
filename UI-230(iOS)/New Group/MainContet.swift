//
//  MainContet.swift
//  UI-230(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/10.
//

import SwiftUI

struct MainContet: View {
    @State var text = ""
   @Binding var showMenu : Bool
    var body: some View {
        VStack{
            
            HStack{
                
                
                if !isMacOS(){
                    
                    Button(action: {
                        
                        
                        withAnimation{
                            
                            showMenu.toggle()
                        }
                        
                    }) {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }
                
                Text("DASHBOARD")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                if isMacOS(){
                    
                    
                    CustomSearchBar(text: $text)
                        .frame(width: 300)
                    
                    
                }
                
                
                
               
            }
            .padding(isMacOS() ? 15 : 0)
            
            if !isMacOS(){
                
                CustomSearchBar(text: $text)
                    .padding(.bottom)
                
                
            }
            
            
          
            ZStack{
                
                
                if isMacOS(){
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        BodyContent()
                        
                       
                        
                    }
                }
                else{
                    
                    BodyContent()
                    
                }
            }
            
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("gray"))
            .cornerRadius(isMacOS() ? 10 : 0)
            .padding(isMacOS() ? 10 : 0)
            
            
            
            
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct MainContet_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BodyContent : View {
    var body: some View{
        
        
        VStack{
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                
                HStack{
                    
                    StorageView(image: "dropbox", title: "Drop Box", percentLog: 0.6)
                    
                   
                    
                    StorageView(image: "google-drive", title: "Google Drive", percentLog: 0.3)
                    
                    StorageView(image: "icloud", title: "Icloud Drive", percentLog: 0.8)
                    
                    
                }
                
                
                
                
            }
            
            
            Text("Quick Access")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack{
                    
                    
                    AccessButton(title: "Pictures", image: "photo", color: .yellow)
                    
                    AccessButton(title: "Music", image: "music.note.house.fill", color: .red)
                    
                    AccessButton(title: "Videos", image: "play.rectangle.fill", color: .green)
                    
                    AccessButton(title: "Apps", image: "square.grid.2x2.fill", color: .blue)
                    
                    AccessButton(title: "Documents", image: "doc.fill", color: .purple)
                    
                    AccessButton(title: "Download", image: "arrow.down.app.fill", color: .pink)
                    
                }
                .padding(.top)
                
                
            })
            
            
            
            Text("Recent Access")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                
                HStack{
                    
                    VStack{
                        
                        HStack{
                            
                            
                            Text("NAME")
                                .font(.callout)
                                .foregroundColor(.gray)
                            
                            Spacer(minLength: 0)
                            
                            
                            Text("Size")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            
                        }
                       
                        
                        Divider()
                        
                        
                        VStack(spacing:15){
                            
                            
                            FilesView(fileImage: "photo", filename: "LADY GAGA", fileSize: "589MB", birth: "1988/3/28")
                            
                            FilesView(fileImage: "play.rectangle.fill", filename: "Kavsoft", fileSize: "555MB", birth: "????")
                            
                            FilesView(fileImage: "photo", filename: "iJustin", fileSize: "60MB", birth: "1984/3/20")
                            
                            FilesView(fileImage: "play.rectangle.fill", filename: "Swift UI", fileSize: "100MB", birth: "2018")
                            
                            FilesView(fileImage: "photo", filename: "Tim", fileSize: "3MB", birth: "2045/5/3")
                        }
                        
                    }
                    .padding()
                   .frame(width: 250)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                    
                }
                .padding(.top)
                
                
            })
            
            
            
            
            
        }
        .padding(isMacOS() ? 10 : 0)
        
        
        
    }
}

struct CustomSearchBar : View {
    
    @Binding var text : String
    var body: some View{
        
        HStack{
            
            TextField("Enter", text: $text)
            
            Button(action: {}) {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color("blue"))
                    .cornerRadius(4)
            }
                
        }
        .padding(.leading)
        .background(Color.white)
       
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
        
        
    }
}

struct StorageView: View {
    var image : String
    var title : String
    var percentLog : CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack{
                
                
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                
                Divider()
                    .frame(height: 45)
                
                
                ZStack{
                    
                    
                    Circle()
                        .stroke(Color.gray,lineWidth: 8)
                    
                    Circle()
                        .trim(from: 0, to: percentLog)
                        .stroke(Color.blue,lineWidth: 8)
                        .rotationEffect(.init(degrees: -90))
                    
                    
                    Text("\(Int(percentLog * 100))%")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    
                    
                    
                    
                }
                .frame(width: 50, height: 50)
                
                
            }
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            
            Text("143GB / 150GB")
            
            
            
            
        }
        .padding()
    }
}

struct AccessButton: View {
    
    var title : String
    var image : String
    var color : Color
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            VStack(spacing:15){
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(color)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                
                
            }
            .frame(width: isMacOS() ? 80 : 100)
        })
    }
}

struct FilesView: View {
    var fileImage :String
    var filename : String
    var fileSize : String
    var birth : String
    
    var body: some View {
        HStack{
            
            Image(systemName: fileImage)
                .font(.title)
                .font(.footnote)
                .foregroundColor(fileImage == "photo" ? .yellow : .red)
            
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(filename)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                
                Text(birth)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.blue)
                
                
                
            })
            
            Spacer(minLength: 40)
            
            
            Text(fileSize)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            
            
        }
    }
}
