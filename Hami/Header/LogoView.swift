//
//  LogoView.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-11.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image("HAMI-2")
                        .padding([.bottom, .trailing], 25.0)
                
                Text("AMI")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.blue)
                    .padding(.leading, 67.0)
                }
            }
        }
    }
}

#Preview {
    LogoView()
}
