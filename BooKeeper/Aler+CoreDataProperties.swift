//
//  Aler+CoreDataProperties.swift
//  BooKeeper
//
//  Created by Guilherme Calado on 16/06/2018.
//  Copyright © 2018 Guilherme Calado. All rights reserved.
//
//

import Foundation
import CoreData


extension Aler {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Aler> {
        return NSFetchRequest<Aler>(entityName: "Aler")
    }

    @NSManaged public var autor: String?
    @NSManaged public var genero: String?
    @NSManaged public var titulo: String?

}
