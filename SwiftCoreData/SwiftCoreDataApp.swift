//
//  SwiftCoreDataApp.swift
//  SwiftCoreData
//
//  Created by Charles Michael on 4/2/25.
//

import SwiftUI
import CoreData

class CoreDataStack: ObservableObject {
    private let persistentContainer:
    NSPersistentContainer
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    init(modelName: String ) {
        persistentContainer = {
            let container = NSPersistentContainer(name: modelName)
            container
                .loadPersistentStores { description,
                    error in
                    if let error = error {
                        print(error)
                    }
                }
            return container
        } ()
    }
    
    func save() {
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}

@main
struct SwiftCoreDataApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coreDataStack)
                .environment(\.managedObjectContext, coreDataStack.managedObjectContext)
        }
    }
}
