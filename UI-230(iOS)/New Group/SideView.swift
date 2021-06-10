//
//  SideView.swift
//  UI-230(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/10.
//

import SwiftUI

struct SideView: View {
    var body: some View {
        VStack{
            
            
            Text("StorRage")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            
            VStack{
                
                
                ZStack{
                    
                    
                    Circle()
                        .stroke(Color.gray.opacity(0.3),lineWidth: 15)
                    
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.blue,style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack(spacing:12){
                        
                        Text("70%")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("USED")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    
                    
                }
                .padding(.vertical,12)
                .padding(.horizontal,25)
            
                .frame(width: 130, height: 170)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                
            }
            
            
            HStack{
                
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Total Space")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                    Text("256GB")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                }
                
                 VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Used Space")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                    Text("128GB")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                }
                
                
                
                
            }
            
            
            
            
        }
        .frame(width: 220)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color("gray").ignoresSafeArea())
        
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
