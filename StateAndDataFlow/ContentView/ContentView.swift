//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private let contentViewMV = ContentViewViewModel()
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text(contentViewMV.counter.formatted())
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(
                    title: contentViewMV.buttonTitle,
                    color: .red,
                    action: contentViewMV.startTimer
                )
                
                Spacer()

                ButtonView(
                    title: "LogOut",
                    color: .blue,
                    action: loginViewVM.logout
                )
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewViewModel())
}
