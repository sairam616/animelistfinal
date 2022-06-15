//
//  DetailsViewController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-07.
//

import UIKit

class DetailsViewController_1: UIViewController {
    
    var animeTitle: String = ""
    var animeRank : Int = 0
    var animeEp :String = ""
    var animeEpTitle : String = ""
    var animeImg : String = ""

    @IBOutlet weak var myLabelEp: UILabel!
    @IBOutlet weak var myLabelEpTitle: UILabel!
    @IBOutlet weak var myLabelRank: UILabel!
    @IBOutlet weak var myLabelTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabelTitle.text?.append(contentsOf: animeTitle)
        myLabelEp.text?.append(contentsOf: animeEp)
        myLabelRank.text?.append(contentsOf: String(animeRank))
        myLabelEpTitle.text?.append(contentsOf: animeEpTitle)
        apiController.shared.getArt_highres(url: animeImg)
        {
            Result in
            switch Result
            {
                case .success(let img):
                    DispatchQueue.main.async
                    {
                        self.myImage.image = img
                    }
                case .failure(let error):
                    print(error)
            
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
