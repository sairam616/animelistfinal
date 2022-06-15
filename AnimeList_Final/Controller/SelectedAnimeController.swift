//
//  SelectedAnimeController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-06.
//

import UIKit
import CoreData

class myCustomTableViewCell : UITableViewCell
{
    @IBOutlet weak var myCustomLabel: UILabel!
    @IBOutlet weak var myCustomImage: UIImageView!
}

class SelectedAnimeController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    lazy var listItems0 = [animeListItems0]()
    var listItems1 : animeListItems1?
    lazy var listItems2 = [animeListItems2]()
    lazy var listItems3 = [animeListItems3]()
    lazy var listItems4 = [animeListItems4]()
    
    lazy var listType : Int = 0
    lazy var count1 : Int = 0
    lazy var count2 : Int = 0
    lazy var count3 : Int = 0 
    @IBOutlet weak var tableView: UITableView!
    var flag : Int = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        if(flag == 0)
        {
            apiController.shared.getDetailsFromAnimeList0()
            {   resultsFromAPI in
                DispatchQueue.main.async
                {
                    self.listItems0 = resultsFromAPI
                    self.tableView.reloadData()
                }
            }
        }
        else if(flag == 1)
        {
            apiController.shared.getDetailsFromAnimeList1()
            {   resultsFromAPI in
                DispatchQueue.main.async
                {
                    self.listItems1 = resultsFromAPI
                    self.count1 = (resultsFromAPI.today.items.all.count)
                    self.count2 = (resultsFromAPI.yesterday.items.all.count)
                    self.count3 = (resultsFromAPI.two_days.items.all.count)
                    self.tableView.reloadData()
                }
            }
        }
        else if(flag == 2)
        {
            apiController.shared.getDetailsFromAnimeList2()
            {   resultsFromAPI in
                DispatchQueue.main.async
                {
                    self.listItems2 = resultsFromAPI
                    self.tableView.reloadData()
                }
            }
        }
        else if(flag == 3)
        {
            apiController.shared.getDetailsFromAnimeList3()
            {   resultsFromAPI in
                DispatchQueue.main.async
                {
                    self.listItems3 = resultsFromAPI
                    self.tableView.reloadData()
                }
            }
        }
        else
        {
            apiController.shared.getDetailsFromAnimeList4()
            {   resultsFromAPI in
                DispatchQueue.main.async
                {
                    self.listItems4 = resultsFromAPI
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(flag == 0)
        {
            return listItems0.count
        }
        else if(flag == 1)
        {
            if(listType == 0)
            {
                return count1
            }
            else if(listType == 1)
            {
               return count2
            }
            else{
               return count3
            }
        }
        else if(flag == 2)
        {
            return listItems2.count
        }
        else if(flag == 3)
        {
            return listItems3.count
        }
        else
        {
            return listItems4.count
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
         let cell:myCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! myCustomTableViewCell
        
        if(flag == 0)
        {
            let item = listItems0[indexPath.row];
            cell.myCustomLabel.text = item.title
            apiController.shared.getArt_highres(url: item.art)
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
        else if(flag == 1)
        {
                if(listType == 0)
                {
                    let item = listItems1?.today.items.all[indexPath.row]
                    cell.myCustomLabel.text = item?.title
                    apiController.shared.getPoster(url: item!.poster)
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
                else if(listType == 1)
                {
                    let item = listItems1?.yesterday.items.all[indexPath.row]
                    cell.myCustomLabel.text = item?.title
                    apiController.shared.getPoster(url: item!.poster)
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
                    let item = listItems1?.two_days.items.all[indexPath.row]
                    cell.myCustomLabel.text = item?.title
                    apiController.shared.getPoster(url: item!.poster)
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
        }
        else if(flag == 2)
        {
            let item = listItems2[indexPath.row];
            cell.myCustomLabel.text = item.title
            apiController.shared.getPoster(url: item.poster)
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
        else if(flag == 3)
        {
            let item = listItems3[indexPath.row];
            cell.myCustomLabel.text = item.title
            apiController.shared.getPoster(url: item.poster)
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
            let item = listItems4[indexPath.row];
            cell.myCustomLabel.text = item.title
            apiController.shared.getPoster(url: item.poster)
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
        return cell
    }
    

    private func add(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .normal, title: "Add to Favorites")
        { [weak self] (_, _, _) in

            let alert = UIAlertController.init(title: "Add to Favorites", message: "Are you sure you want to add this anime to Favorites?", preferredStyle: .alert)

            let YesAction = UIAlertAction.init(title: "Yes", style: .default)
            { (action) in
                
                if(self!.flag == 0)
                {
                    let newItem = self!.listItems0[indexPath.row];
                    CoreDataManager.shared.saveToFavorites(title: newItem.title, imageURL: newItem.art,imageId: 0.0 )
                }
                else if(self!.flag == 1)
                {
                    if(self!.listType == 0)
                    {
                        let newItem = self?.listItems1?.today.items.all[indexPath.row]
                        CoreDataManager.shared.saveToFavorites(title: newItem!.title, imageURL: newItem!.poster,imageId: 1.0)
                    }
                    else if(self!.listType == 1)
                    {
                        let newItem = self!.listItems1?.yesterday.items.all[indexPath.row];
                        CoreDataManager.shared.saveToFavorites(title: newItem!.title, imageURL: newItem!.poster , imageId: 1.1)
                    }
                    else
                    {
                        let newItem = self!.listItems1?.two_days.items.all[indexPath.row];
                        CoreDataManager.shared.saveToFavorites(title: newItem!.title, imageURL: newItem!.poster,imageId: 1.2)
                    }
                }
                else if(self!.flag == 2)
                {
                    print("flag:",self!.flag)
                    let newItem = self!.listItems2[indexPath.row];
                    CoreDataManager.shared.saveToFavorites(title: newItem.title, imageURL: newItem.poster , imageId: 2.0)
                }
                else if(self!.flag == 3)
                {
                    let newItem = self!.listItems3[indexPath.row];
                    CoreDataManager.shared.saveToFavorites(title: newItem.title, imageURL: newItem.poster ,imageId: 3.0)
                }
                else
                {
                    let newItem = self!.listItems4[indexPath.row];
                    CoreDataManager.shared.saveToFavorites(title: newItem.title, imageURL: newItem.poster,imageId: 4.0)
                }
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
        let add = self.add(rowIndexPathAt: indexPath)
        add.backgroundColor = .cyan
        let swipe = UISwipeActionsConfiguration(actions: [add])
        return swipe
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(flag == 0)
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_1") as? DetailsViewController_1
            VC?.animeTitle = listItems0[indexPath.row].title
            VC?.animeRank = listItems0[indexPath.row].rank
            VC?.animeEp = listItems0[indexPath.row].episode
            VC?.animeEpTitle = listItems0[indexPath.row].episode_title
            VC?.animeImg = listItems0[indexPath.row].art
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        else if(flag == 1)
        {
            if(listType == 0)
            {
                let item = listItems1?.today.items.all[indexPath.row]
                let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_3") as? DetailsViewController_3
                VC?.listType = self.listType
    
                VC?.animeTitle = item!.title
                VC?.animeRank = String(item!.rank)
                VC?.animeNetwork = item!.network ?? "NA"
                VC?.animeTime = item!.air_time
                VC?.animeEp = String(item!.episode)
                VC?.animeSeason = String(item!.season)
                VC?.animeImg = item!.poster
                VC?.animeWatched = String(item!.watched)
                self.navigationController?.pushViewController(VC!, animated: true)
            }
            else if(listType == 1)
            {
                let item = listItems1?.yesterday.items.all[indexPath.row]
                let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_3") as? DetailsViewController_3
                VC?.listType = self.listType
                VC?.animeTitle = item!.title
                VC?.animeRank = String(item!.rank)
                VC?.animeTime = item!.air_time
                VC?.animeEp = String(item!.episode)
                VC?.animeSeason = String(item!.season)
                VC?.animeImg = item!.poster
                VC?.animeWatched = String(item!.watched)
                self.navigationController?.pushViewController(VC!, animated: true)
            }
            else{
                let item = listItems1?.two_days.items.all[indexPath.row]
                let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_3") as? DetailsViewController_3
                VC?.listType = self.listType
                VC?.animeTitle = item!.title
                VC?.animeRank = String(item!.rank)
                VC?.animeNetwork = item!.network ?? "NA"
                VC?.animeTime = item!.air_time
                VC?.animeEp = String(item!.episode)
                VC?.animeSeason = String(item!.season)
                VC?.animeImg = item!.poster
                VC?.animeWatched = String(item!.watched)
                self.navigationController?.pushViewController(VC!, animated: true)
            }
            
        }
        else if(flag == 2)
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_2") as? DetailsViewController_2
            VC?.animeTitle = listItems2[indexPath.row].title
            VC?.animeType = listItems2[indexPath.row].anime_type
            VC?.animeBottomText = listItems2[indexPath.row].bottom_text
            VC?.animeImg = listItems2[indexPath.row].poster
            VC?.flag = 2;
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        else if(flag == 3)
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_2") as? DetailsViewController_2
            VC?.animeTitle = listItems3[indexPath.row].title
            VC?.animeType = listItems3[indexPath.row].anime_type
            VC?.animeBottomText = listItems3[indexPath.row].bottom_text
            VC?.animeImg = listItems3[indexPath.row].poster
            VC?.flag = 3;
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        else
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_2") as? DetailsViewController_2
            VC?.animeTitle = listItems4[indexPath.row].title
            VC?.animeType = listItems4[indexPath.row].anime_type
            VC?.animeBottomText = listItems4[indexPath.row].bottom_text
            VC?.animeImg = listItems4[indexPath.row].poster
            VC?.flag = 4;
            self.navigationController?.pushViewController(VC!, animated: true)
        }
    }
}

