//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var framework: Framework
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isShowingDetailView = false
                }, label: {
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.label))
                        .padding()
                })
            }.padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework, largeTitle: true)
            
            Text(framework.description).font(.body).padding()
            
            Spacer()
            
            Button(action: {
                isShowingSafariView = true
            }, label: {
                AppButton(buttonText: "Learn More")
            })
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.url) ?? URL(string: "https://developer.apple.com/develop/")!)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(isShowingDetailView: .constant(false), framework: MockData.frameworks[0])
    }
}
