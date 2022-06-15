//
//  EpisodesViewController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-13.
//

import UIKit

class EpisodesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource
{
    var episodes = ["Todays Episodes","Yesterdays Episodes","Two Days Episodes"]
    @IBOutlet weak var tableView: UITableView!
    lazy var listType : Int = 0

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
        }

          func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return 3
        }

         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) 
            cell.textLabel?.text = episodes[indexPath.row]
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(indexPath.row == 0)
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "SelectedAnimeController") as? SelectedAnimeController
            VC!.listType = indexPath.row
            VC!.flag = 1
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        else if(indexPath.row == 1)
        {
            let VC = storyboard?.instantiateViewController(withIdentifier: "SelectedAnimeController") as? SelectedAnimeController
            VC!.listType = indexPath.row
            VC!.flag = 1
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        else{
            let VC = storyboard?.instantiateViewController(withIdentifier: "SelectedAnimeController") as? SelectedAnimeController
            VC!.listType = indexPath.row
            VC!.flag = 1
            self.navigationController?.pushViewController(VC!, animated: true)
        }
    }
}
