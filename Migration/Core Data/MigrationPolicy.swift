//
//  MigrationPolicy.swift
//  Migration
//
//  Created by Faraz Habib on 03/08/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import CoreData

class MigrationPolicy : NSEntityMigrationPolicy {
    
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        
        let dInstance = NSEntityDescription.insertNewObject(forEntityName: mapping.destinationEntityName!, into: manager.destinationContext)
        
        let personIDIntValue = sInstance.value(forKey: "personID") as! Int32
        let personIDStrValue = "\(personIDIntValue)"
        dInstance.setValue(personIDStrValue, forKey: "personID")
    }
    
}
