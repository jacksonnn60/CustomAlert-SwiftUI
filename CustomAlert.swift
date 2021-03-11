//
//  CustomAlert.swift
//  SwifUI-CustomThings
//
//  Created by Jacksons MacBook on 10.03.2021.
//

import SwiftUI

struct CustomAlert: View {
    
    private let screen = UIScreen.main.bounds
    var title: String?
    var submitButtonTitle: String?
    var cancelButtonTitle: String?
    var backgroundColor: Color?
    
    
    var placeholder1: String?
    var placeholder2: String?
    
    
    var handler: (String) -> () = {_ in}
    
    @Binding var isPresented: Bool
    @Binding var text1: String
    @Binding var text2: String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.title ?? "Title")
                    .font(.system(size: 24, weight: .medium))
                
                Image(systemName: "paperclip")
                    .font(.system(size: 24, weight: .light))
            }
            .padding(.top, 20)

            TextField(self.placeholder1 ?? "write...",
                      text: $text1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 20)
                .padding(.horizontal, 10)
            
            TextField(self.placeholder2 ?? "write...",
                      text: $text2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 10)
            
            HStack {
                Button(action: {
                    self.handler(text1)
                    self.handler(text2)
                    self.isPresented = false
                }, label: {
                    Text("Submit")
                        .foregroundColor(.green)
                        .font(.system(size: 22, weight: .medium))
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    self.isPresented = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .font(.system(size: 22, weight: .medium))
                })
                .padding()
            }
            Spacer()
        }
        .frame(width: self.screen.width * self.frameWidthScale,
               height: self.screen.height * self.frameHeightScale,
               alignment: .center)
        
        .background(self.backgroundColor ?? Color(.systemGray5))
        .cornerRadius(self.cornerRadius)
        .shadow(color: self.backgroundColor ?? Color.gray,
                radius: 5.0,
                x: self.XShadow,
                y: self.YShadow)
        
        .offset(x: self.isPresented ? self.screen.width * self.offsetWidthScale : screen.width,
                y: self.isPresented ? self.screen.height * self.offsetHeightScale : screen.height)
        
        .animation(.spring())
    }
    
    //MARK: -Variables
    private let offsetWidthScale: CGFloat = 0.1
    private let offsetHeightScale: CGFloat = 0.25
    private let cornerRadius: CGFloat = 12 
    private let XShadow: CGFloat = 7.0
    private let YShadow: CGFloat = 7.0
    private let frameWidthScale: CGFloat = 0.7
    private let frameHeightScale: CGFloat = 0.35
    //--
}

//DEBUG:
struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert( isPresented: .constant(true),
                     text1: .constant(""),
                     text2: .constant(""))
    }
}

