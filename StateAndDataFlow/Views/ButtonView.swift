//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Алексей Журкин on 12.02.2025.
//

import SwiftUI

struct ButtonView: View {
    // MARK: - Properties
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color)
    }
}

#Preview {
    ButtonView(title: "Some Action", color: .red, action: {})
}
