//
//  TableViewController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-03.
//

import UIKit
import CoreData

class myTableViewController: UITableViewController {
    
    var animeCategories = ["Top Aired Fanarts","New Episodes","Most Watched This Month","Top Last Aired","Premiers"]

    var rowNumber : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

     override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animeCategories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = animeCategories[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row != 1)
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "SelectedAnimeController") as? SelectedAnimeController
            VC!.flag = indexPath.row
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        else
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "EpisodesViewController") as? EpisodesViewController
            self.navigationController?.pushViewController(VC!, animated: true)
        }
    }
    
}
