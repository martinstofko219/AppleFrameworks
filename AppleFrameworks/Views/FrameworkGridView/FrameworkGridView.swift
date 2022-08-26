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
//                FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, framework: viewModel.selectedFramework ?? MockData.frameworks[0])
                FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: viewModel.selectedFramework ?? MockData.frameworks.first!,
                                                                        isShowingDetailView: $viewModel.isShowingDetailView))
            })
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
