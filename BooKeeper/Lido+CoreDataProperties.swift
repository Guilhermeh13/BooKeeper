//
//  Lido+CoreDataProperties.swift
//  BooKeeper
//
//  Created by Guilherme Calado on 16/06/2018.
//  Copyright © 2018 Guilherme Calado. All rights reserved.
//
//

import Foundation
import CoreData


extension Lido {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lido> {
        return NSFetchRequest<Lido>(entityName: "Lido")
    }

    @NSManaged public var genero: String?
    @NSManaged public var titulo: String?
    @NSManaged public var classificacao: String?
    @NSManaged public var autor: String?

}
