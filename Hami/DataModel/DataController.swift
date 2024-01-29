//
//  DataController.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-02.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "PersonsModel")
    
    init() {
        container.loadPersistentStores {desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!! Wooohooo!!!")
        } catch {
            print("We could not save the date...")
        }
    }
    
    func addPersons(name: String, amounts: Int, comment: String, context: NSManagedObjectContext) {
        let persons = Persons(context: context)
        persons.id = UUID()
        persons.date = Date()
        persons.name = name
        persons.amounts = Float(Double(amounts))
        persons.comment = comment
        
        save(context: context)
    }
    
    func editPersons(persons: Persons, name: String, comment: String, amounts: Int, context: NSManagedObjectContext) {
        persons.date = Date()
        persons.name = name
        persons.amounts = Float(Double(amounts))
        persons.comment = comment
        
        save(context: context)
    }
}
