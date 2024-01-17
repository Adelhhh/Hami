//
//  HamiApp.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-02.
//

import SwiftUI

@main
struct HamiApp: App {
    
    @StateObject private var datacontroller = DataController()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, datacontroller.container.viewContext)
        }
    }
}
