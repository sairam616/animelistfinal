//
//  Favorites+CoreDataProperties.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-07.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?

}

extension Favorites : Identifiable {

}
