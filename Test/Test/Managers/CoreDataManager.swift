//
//  CoreDataManager.swift
//  Test
//
//  Created by Alexander on 21.05.25.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "Test")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Core Data load error: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        container.viewContext
    }

    func saveLoginResponse(_ response: LoginResponse) {
        let entity = LoginEntity(context: context)
        entity.accessToken = response.accessToken
        entity.refreshToken = response.refreshToken
        entity.expires = response.expires
        entity.accessTokenHash = response.accessTokenHash
        entity.language = response.language

        do {
            try context.save()
        } catch {
            print("Failed to save login: \(error)")
        }
    }
}
