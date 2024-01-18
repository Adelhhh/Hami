//
//  AddPersonsView.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-04.
//

import SwiftUI

struct AddPersonsView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var amounts: Double = 0
    
    var body: some View {
        
       LogoView()
        
        Form {
            Section {
                VStack {
                    TextField("Write a name here", text: $name)
                        .padding(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1))
                }
                .frame(width: 300, height: 30)
                .padding()
                
                VStack {
                    HStack {
                        Text(String(amounts))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        /* Text("kr")
                         .font(.title2)
                         .fontWeight(.bold) */
                        
                    }
                    
                    HStack {
                        Stepper("", value: $amounts, in: 0...10000, step: 10)
                    }
                    .frame(width: 100, height: 30, alignment: .center)
                    
                }
                .padding(.horizontal, 100.0)

                VStack {
                    HStack {
                        Button(action: {
                            DataController().addPersons(name: name, amounts: amounts, context: managedObjContext)
                            dismiss()
                        }, label: {
                            Text("Submit")
                        })
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 40)
                        .background(Color(.green).cornerRadius(8.0))
                        .padding([.top, .bottom], 10.0)
                        .padding(.horizontal, 100)
                    }
                }            
                .padding(.horizontal, 70.0)
            }
        }
    }
}

#Preview {
    AddPersonsView()
}
