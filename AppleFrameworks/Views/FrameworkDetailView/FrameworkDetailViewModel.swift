//
//  FrameworkDetailViewModel.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/26/22.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var isShowingSafariView = false
    
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
