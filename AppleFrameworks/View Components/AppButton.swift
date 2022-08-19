//
//  Button.swift
//  AppleFrameworks
//
//  Created by Martin Stofko on 8/18/22.
//

import SwiftUI

struct AppButton: View {
    var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(buttonText: "Button Text")
    }
}
