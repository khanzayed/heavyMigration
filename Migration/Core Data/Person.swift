//
//  Person.swift
//  Migration
//
//  Created by Faraz Habib on 03/08/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var personID: Int32
    
}

extension Person {
    
    internal func setupPerson() {
        let sample = SamplePerson()
        name = sample.name
        age = sample.age
        personID = sample.personID
    }
    
}
