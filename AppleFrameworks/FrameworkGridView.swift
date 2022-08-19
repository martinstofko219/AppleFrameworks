//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MockData.frameworks) { f in
                        FrameworkTitleView(framework: f, largeTitle: false)
                            .onTapGesture {
                                viewModel.selectedFramework = f
                            }
                    }
                })
            }
            .navigationTitle("Apple Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                // instead of MockData we should create a special empty state data set to use in case of nil
                FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, framework: viewModel.selectedFramework ?? MockData.frameworks[0])
            })
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

struct FrameworkTitleView: View {
    let framework: Framework
    let largeTitle: Bool
    
    var body: some View {
        VStack {
            Image(framework.imageName).resizable().frame(width: 85, height: 85)
            Text(framework.name)
                .font(largeTitle ? .title : .title2)
                .fontWeight(largeTitle ? .bold : .medium)
                .scaledToFit().minimumScaleFactor(0.6)
        }.padding()
    }
}
