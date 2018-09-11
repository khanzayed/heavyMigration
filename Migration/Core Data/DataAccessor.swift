//
//  DataAccessor.swift
//  Migration
//
//  Created by Faraz Habib on 03/08/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit
import CoreData

struct SamplePerson {
    
    let name = "Faraz"
    let age:Int16 = 27
    let personID:Int32 = 1
    
}

class DataAccessor {
    
    static let shared = DataAccessor()

    var appDelegate:AppDelegate!
    var managedObjectContext:NSManagedObjectContext!
    
    private init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = self.appDelegate.persistentContainer.viewContext
    }
    
    internal func checkIfDataExist() -> Bool {
        do {
            if let results = try managedObjectContext.fetch(Person.fetchRequest()) as? [Person] {
                return (results.count > 0)
            }
        } catch {
            print ("There was an error")
        }
        return false
    }
    
    internal func saveSampleData() {
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedObjectContext) as! Person
        person.setupPerson()
        
        do {
            try managedObjectContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    internal func fetchAllPersons() -> [Person] {
        do {
            if let results = try managedObjectContext.fetch(Person.fetchRequest()) as? [Person] {
                return results
            }
        } catch {
            print ("There was an error")
        }
        return []
    }
    
}
