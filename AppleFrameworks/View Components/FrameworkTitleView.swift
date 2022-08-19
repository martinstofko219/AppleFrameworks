//
//  FrameworkTitleView.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

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

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.frameworks[0], largeTitle: false)
    }
}
