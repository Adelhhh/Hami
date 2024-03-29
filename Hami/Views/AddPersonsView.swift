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
    @State private var amounts: Int = 0
    @State private var comment = ""
    
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
                            .font(.title)
                            .fontWeight(.bold) 
                        
                        
                        /* Text("kr")
                         .font(.title2)
                         .fontWeight(.bold) */
                        
                    }
                    
                    HStack {
                        Stepper("", value: $amounts, in: 0...10000, step: 5)
                    }
                    .frame(width: 100, height: 30, alignment: .center)
                    
                }
                .padding(.horizontal, 120.0)
                
                VStack {
                    TextField("Comment...", text: $comment)
                        .padding(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1))
                }
                .frame(width: 300, height: 30)
                .padding()

                VStack {
                    HStack {
                        Button(action: {
                            DataController().addPersons(name: name, amounts: amounts, comment: comment, context: managedObjContext)
                            dismiss()
                            
                        }, label: {
                            Text("Submit")
                        })
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 40)
                        .background(Color(.blue).cornerRadius(8.0))
                        .padding([.top, .bottom], 10.0)
                        .padding(.horizontal, 100)
                    }
                }            
                .padding(.horizontal, 120.0)
            }
        }
    }
}

#Preview {
    AddPersonsView()
}
