//
//  ContentView.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-02.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    private func totalAmountsToday() -> Double {
        var amountsToday: Double = 0
        for item in persons {
            if Calendar.current.isDateInToday(item.date!) {
                amountsToday += item.amounts
            }
        }
        return amountsToday
    }
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var persons: FetchedResults<Persons>
    
    @State private var showingAddView = false
    
    var body: some View {
        
        LogoView()
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("Total:  \(Int(totalAmountsToday()))  (Today) ")
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .italic()
                    .padding()
                    .frame(width: 360.0, height: 30.0)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1))
                
                List {
                    ForEach(persons) {person in
                        NavigationLink(destination: EditPersonView(persons: person)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    if person.name != nil {
                                        Text(person.name!)
                                            .bold()
                                    }
                                    
                                    Text("\(Int(person.amounts))") + Text("      ").foregroundColor(.blue)
                                }
                                
                                Spacer()
                                
                                if person.date != nil {
                                    Text(calcTimeSince(date:person.date!))
                                        .foregroundColor(.gray)
                                        .italic()
                                }
                                Spacer()
                                Button("", systemImage: "pencil") {
                                    showingAddView.toggle()
                                }
                            }
                        }
                    }
                    .onDelete(perform: deletePerson)
                }
                .listStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Person", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddPersonsView()
                    
            }
            .padding(.top, 5.0)
            .padding(.horizontal, 20.0)
            
        }
        .navigationViewStyle(.stack)
        
    }
    
    private func deletePerson(offsets: IndexSet) {
        withAnimation {
            offsets.map { persons[$0]}.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
}

#Preview {
    ContentView()
}
