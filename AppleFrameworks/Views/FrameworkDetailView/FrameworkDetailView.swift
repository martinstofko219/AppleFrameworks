//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

struct FrameworkDetailView: View {
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    viewModel.isShowingDetailView.wrappedValue = false
                }, label: {
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.label))
                        .padding()
                })
            }.padding()
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework, largeTitle: true)
            
            Text(viewModel.framework.description).font(.body).padding()
            
            Spacer()
            
            Link(destination: URL(string: viewModel.framework.url) ?? URL(string: "https://developer.apple.com/develop/")!) {
                Text("Learn More")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(.primary)
                    .cornerRadius(10)
            }
            
//            Button(action: { viewModel.isShowingSafariView = true },
//                   label: {
//                Text("Learn More")
//                    .fontWeight(.semibold)
//                    .frame(width: 250)
//            })
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
//            .tint(.blue)
        }
//        .fullScreenCover(isPresented: $viewModel.isShowingSafariView, content: {
//            SafariView(url: URL(string: viewModel.framework.url) ?? URL(string: "https://developer.apple.com/develop/")!)
//        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.frameworks.first!, isShowingDetailView: .constant(true)))
    }
}
