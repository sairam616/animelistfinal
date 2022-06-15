//
//  FavoritesViewController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-07.
//

import UIKit
import CoreData



class myFavTableViewCell : UITableViewCell
{
    
    @IBOutlet weak var myCategory: UILabel!
    @IBOutlet weak var myCustomLabel: UILabel!
    
    @IBOutlet weak var myCustomImage: UIImageView!
}

class FavoritesViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,NSFetchedResultsControllerDelegate
{
    var searching : Bool = false
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        do
        {
            try  CoreDataManager.shared.fetchedResultController.performFetch()
            CoreDataManager.shared.fetchedResultController.delegate = self
        }catch
        {
            print (error)
        }
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.count == 0
        {
            searching = false
            tableView.reloadData()
        }
        else
        {
            searching = true
            CoreDataManager.shared.fetchFavContains(text: searchText)
            tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if !searching
        {
            guard CoreDataManager.shared.fetchedResultController.sections != nil else
            {
                return 0
            }
        }
        else
        {
            guard (CoreDataManager.shared.searchFetchedResultController?.sections) != nil else
            {
                return 0
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if !searching
        {
            return CoreDataManager.shared.fetchedResultController.fetchedObjects!.count
        }
        else
        {
            return (CoreDataManager.shared.searchFetchedResultController?.fetchedObjects!.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:myFavTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! myFavTableViewCell
        var fav : Favorites?

        if(!searching)
        {
            fav = CoreDataManager.shared.fetchedResultController.object(at: indexPath)
            if(fav!.imageId == 0.0)
            {
                apiController.shared.getArt_highres(url: fav!.image!)
                {
                    Result in
                    switch Result
                    {
                        case .success(let img):
                            DispatchQueue.main.async
                            {
                                cell.myCustomImage.image = img
                            }
                        case .failure(let error):
                            print(error)
                    }
                }
            }
            else{
                apiController.shared.getPoster(url: fav!.image!)
                {
                    Result in
                    switch Result
                    {
                        case .success(let img):
                            DispatchQueue.main.async
                            {
                                cell.myCustomImage.image = img
                            }
                        case .failure(let error):
                            print(error)

                    }
                }
            }
            cell.myCustomLabel.text = fav!.title
            
            if(fav?.imageId == 0.0)
            {
                cell.myCategory.text? = "Category: top aired fanarts"
            }
            else if(fav?.imageId == 1.0)
            {
                cell.myCategory.text? = "Category: Todays Episodes"
            }
            else if(fav?.imageId == 1.1)
            {
                cell.myCategory.text? = "Category: Yesterday Episodes"
            }
            else if(fav?.imageId == 1.2)
            {
                cell.myCategory.text? = "Category: 2 days Episodes"
            }
            else if(fav?.imageId == 2.0)
            {
                cell.myCategory.text? = "Category: Most Watched"
            }
            else if(fav?.imageId == 3.0)
            {
                cell.myCategory.text? = "Category: top last aired"
            }
            else
            {
                cell.myCategory.text? = "Category: premiers"
            }
        }
        else
        {
            fav  = CoreDataManager.shared.searchFetchedResultController?.object(at: indexPath)
            if(fav!.imageId == 0.0)
            {
                apiController.shared.getArt_highres(url: fav!.image!)
                {
                    Result in
                    switch Result
                    {
                        case .success(let img):
                            DispatchQueue.main.async
                            {
                                cell.myCustomImage.image = img
                            }
                        case .failure(let error):
                            print(error)

                    }
                }
            }
            else
            {
                apiController.shared.getPoster(url: fav!.image!)
                {
                    Result in
                    switch Result
                    {
                        case .success(let img):
                            DispatchQueue.main.async
                            {
                                cell.myCustomImage.image = img
                            }
                        case .failure(let error):
                            print(error)

                    }
                }

            }
            cell.myCustomLabel.text = fav!.title
            
            if(fav?.imageId == 0.0)
            {
                cell.myCategory.text? = "Category: top aired fanarts"
            }
            else if(fav?.imageId == 1.0)
            {
                cell.myCategory.text? = "Category: Todays Episodes"
            }
            else if(fav?.imageId == 1.1)
            {
                cell.myCategory.text? = "Category: Yesterday Episodes"
            }
            else if(fav?.imageId == 1.2)
            {
                cell.myCategory.text? = "Category: 2 days Episodes"
            }
            else if(fav?.imageId == 2.0)
            {
                cell.myCategory.text? = "Category: Most Watched"
            }
            else if(fav?.imageId == 3.0)
            {
                cell.myCategory.text? = "Category: top last aired"
            }
            else
            {
                cell.myCategory.text? = "Category: premiers"
            }
        }
        return cell
    }
    
    private func Delete(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .destructive, title: "Delete from Favorites")
        { [weak self] (_, _, _) in

            let alert = UIAlertController.init(title: "Delete from Favorites", message: "Are you sure you want to delete this anime from Favorites?", preferredStyle: .alert)

            let YesAction = UIAlertAction.init(title: "Yes", style: .default)
            { (action) in

                CoreDataManager.shared.deleteTask(animeToDelete: CoreDataManager.shared.fetchedResultController.object(at: indexPath));
            }

            let NoAction = UIAlertAction.init(title: "No", style: .cancel, handler: nil)

            alert.addAction(YesAction)
            alert.addAction(NoAction)
            self!.present(alert, animated: true, completion: nil)
        }
        return action
    }
    
    func tableView (_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
   {
       let delete = self.Delete(rowIndexPathAt: indexPath)
       let swipe = UISwipeActionsConfiguration(actions: [delete])
       return swipe
   }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    {
        switch (type)
        {
        case .delete:
            if let indexPath = indexPath
            {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        default: break
            
        }
    }
}
