//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

struct FrameworkGridView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MockData.frameworks) { f in
                        FrameworkTitleView(framework: f)
                    }
                })
            }
            .navigationTitle("Apple Frameworks")
            
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName).resizable().frame(width: 85, height: 85)
            Text(framework.name).font(.title2).fontWeight(.medium).scaledToFit().minimumScaleFactor(0.6)
        }
    }
}
