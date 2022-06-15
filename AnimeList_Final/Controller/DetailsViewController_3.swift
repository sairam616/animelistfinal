//
//  DetailsViewController_3.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-13.
//

import UIKit

class DetailsViewController_3: UIViewController {
    
    var listItems1 : animeListItems1?
    lazy var listType : Int = 0
    
    var animeTitle: String = ""
    var animeRank : String = ""
    var animeTime :String = ""
    var animeNetwork :String = ""
    var animeEp :String = ""
    var animeSeason :String = ""
    var animeWatched : String = ""
    var animeImg : String = ""


    @IBOutlet weak var lblWatched: UILabel!
    @IBOutlet weak var myEpisode: UILabel!
    @IBOutlet weak var mySeason: UILabel!
    @IBOutlet weak var myNetwork: UILabel!
    @IBOutlet weak var myTime: UILabel!
    @IBOutlet weak var myRank: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitle.text?.append(contentsOf: animeTitle)
        myRank.text?.append(contentsOf: String(animeRank))
        if(listType == 0)
        {
            myNetwork.text?.append(contentsOf: animeNetwork)
        }
        if(listType == 1)
        {
            myNetwork.text?.append(contentsOf: "NA" )
        }
        if(listType == 2)
        {
            myNetwork.text?.append(contentsOf: animeTime)
        }
        myTime.text?.append(contentsOf: animeTime)
        
        
        myEpisode.text?.append(contentsOf: animeEp)
        mySeason.text?.append(contentsOf: animeSeason)
        lblWatched.text?.append(contentsOf: animeWatched)
        apiController.shared.getPoster_highres(url: animeImg)
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
