//
//  PartyCell.swift
//  partyRock
//
//  Created by James Volmert on 9/11/16.
//  Copyright © 2016 James Volmert. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // manipulate the table cell
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        // TODO:  set imageUrl async
        let url = URL(string: partyRock.imageUrl)!
        
        // this is block on a certain thread
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                //  now that we made the async call, we will make the sync call now
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                                   }
            } catch {
                // handle the error
            }
        }
    }

}
