//
//  FrameworkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    @Published var isShowingDetailView = false
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
}
