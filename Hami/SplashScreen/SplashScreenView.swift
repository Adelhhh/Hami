//
//  SplashScreenView.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-11.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
ContentView()
        } else {
                VStack {
                    ZStack {
                                                  Image("HAMI-2")
                                                  .padding([.bottom, .trailing], 25.0)
                                                                  
                                                  Text("AMI")
                                                  .font(.title)
                                                  .fontWeight(.black)
                                                  .foregroundColor(Color.blue)
                                                  .padding(.leading, 67.0)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                    withAnimation(.easeIn(duration: 3)) {
                        self.size = 2
                        self.opacity = 10
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
