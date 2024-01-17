//
//  EditPersonView.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-04.
//

import SwiftUI

struct EditPersonView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var persons: FetchedResults<Persons>.Element
    
    @State private var name = ""
    @State private var amounts: Double = 0
    
    var body: some View {
        Form {
            Section {
                VStack {
                    TextField("\(persons.name!)", text: $name)
                        .onAppear {
                            name = persons.name!
                            amounts = persons.amounts
                        }
                        .padding(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1))
                }
                .frame(width: 300, height: 30)
                .padding()

                VStack {
                    HStack {
                        Text("\(Int(amounts))")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        /* Text("kr")
                         .font(.title2)
                         .fontWeight(.bold)*/
                    }
                    
                    HStack {
                        Stepper("", value: $amounts, in: 0...10000, step: 10)
                    }
                    .frame(width: 100, height: 30, alignment: .center)
                    
                    
                    HStack {
                        Button(action: {
                            DataController().editPersons(persons: persons, name: name, amounts: amounts, context: managedObjContext)
                            dismiss()
                        }, label: {
                            Text("Submit")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        })
                    }
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
