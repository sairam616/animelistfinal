//
//  DetailsViewController_2.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-09.
//

import UIKit

class DetailsViewController_2: UIViewController {
    
    var animeTitle: String = ""
    var animeBottomText : String = ""
    var animeType :String = ""
    var animeImg : String = ""
    var flag : Int = 0

    @IBOutlet weak var myLabelType: UILabel!
    @IBOutlet weak var myLabelText: UILabel!
    @IBOutlet weak var myLabelTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabelTitle.text?.append(contentsOf: animeTitle)
        myLabelType.text?.append(contentsOf: animeType)
        if(flag == 2)
        {
            myLabelText.text = "Episode Ranking:    "
        }
        if(flag == 3)
        {
            myLabelText.text = "Air Date:      "
        }
        if(flag == 4)
        {
            myLabelText.text = "Episode No|Rank:   "
        }
        myLabelText.text?.append(contentsOf: animeBottomText)
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

        // Do any additional setup after loading the view.
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
