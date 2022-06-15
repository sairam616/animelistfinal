//
//  newEpisodesViewController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-13.
//

import UIKit

class myCustomTableViewCell_new : UITableViewCell
{
    @IBOutlet weak var myCustomLabel: UILabel!
    @IBOutlet weak var myCustomImage: UIImageView!
}


class newEpisodesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var listItems1 : animeListItems1?
    lazy var listType : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    // MARK: - Table view data source

      func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(listType == 0)
        {
            return  (listItems1?.today.items.all.count)!;
        }
        else if(listType == 1)
        {
            return  (listItems1?.yesterday.items.all.count)!;
        }
        else{
            //return  (listItems1?.2days.items.all.count)!;
            return 1
        }
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:myCustomTableViewCell_new = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! myCustomTableViewCell_new
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
//            let item = llistItems1?.2days.items.all[indexPath.row]
//            cell.myCustomLabel.text = item.title
//            apiController.shared.getPoster(url: item!.poster)
//            {
//                Result in
//                switch Result
//                {
//                    case .success(let img):
//                        DispatchQueue.main.async
//                        {
//                            cell.myCustomImage.image = img
//                        }
//                    case .failure(let error):
//                        print(error)
//
//                }
//            }
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
