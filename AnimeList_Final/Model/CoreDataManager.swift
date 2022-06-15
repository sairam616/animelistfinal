//
//  CoreDataManager.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-07.
//

import Foundation
import CoreData

class CoreDataManager  {
    
    static var shared = CoreDataManager()
    
    var searchFetchedResultController : NSFetchedResultsController<Favorites>?
    
    lazy var fetchedResultController: NSFetchedResultsController<Favorites> =
    {
        let fetchRequest : NSFetchRequest<Favorites> = Favorites.fetchRequest()
        var sortDescription = NSSortDescriptor(key:"title",ascending: true)
        fetchRequest.sortDescriptors = [sortDescription]
        //where
        // select * from Favorites
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil,cacheName: nil)
        
        return frc
    }()
    
    // insert new Favorites
    func saveToFavorites(title: String, imageURL: String, imageId: Float)  {
        let newFav = Favorites(context: persistentContainer.viewContext)
        newFav.title = title
        newFav.image = imageURL
        newFav.imageId = imageId
        saveContext()
    }

    // select * from Favorites order by title
    func fetchFavContains(text: String)
    {
        do {
        searchFetchedResultController = {
            let fetchRequest : NSFetchRequest<Favorites> =  Favorites.fetchRequest()
            let sortDescription = NSSortDescriptor(key:"title",ascending: true)
            fetchRequest.sortDescriptors = [sortDescription]
            // select * from Favorites where title contains 'value'
            if (!text.isEmpty){
            let p : NSPredicate = NSPredicate(format: "title CONTAINS [c] %@ ",text)
                fetchRequest.predicate = p
                    }

            let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil,cacheName: nil)

            return frc
        }()
        try searchFetchedResultController!.performFetch()
        }
        catch {
        }
    }
    
    
    func fetchAllFavorites() -> [Favorites] {
        let fetch : NSFetchRequest = Favorites.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor.init(key: "title", ascending: true)]
        var result = [Favorites]()
        
        do{
        result = try persistentContainer.viewContext.fetch(fetch)
        }
        catch {
            print(error)
        }
        
        return result
    }
    
    func deleteTask(animeToDelete: Favorites)
    {
        persistentContainer.viewContext.delete(animeToDelete)
        saveContext()
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer =
    {
        let container = NSPersistentContainer(name: "AnimeList_Final")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext ()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
