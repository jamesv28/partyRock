//
//  ViewController.swift
//  partyRock
//
//  Created by James Volmert on 9/10/16.
//  Copyright © 2016 James Volmert. All rights reserved.
//

import UIKit

class mainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    //  get array of data
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        let p1 = PartyRock(imageUrl: "https://pbs.twimg.com/media/CprODuOUMAAQSro.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/jQg9pZal5_8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Empty Space")
        
        let p2 = PartyRock(imageUrl: "http://nme.assets.ipccdn.co.uk/images/2013TheStorySoFar_Press_MattVincent091013.article_x4.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/e_iHep06jqk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Roam")
        
        let p3 = PartyRock(imageUrl: "http://uniteasia.org/wp-content/uploads/2015/09/11933408_10153251522718370_7620691478643344358_n.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/e_iHep06jqk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Nerve")
        
        let p4 = PartyRock(imageUrl: "http://rocktotick.com/wp-content/uploads/2015/10/The-Story-So-Far-Tickets.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/e_iHep06jqk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Quicksand")
        
        let p5 = PartyRock(imageUrl: "http://www.ew.com/sites/default/files/styles/tout_image_612x380/public/i/2016/04/12/the-story-so-far_0.jpg?itok=U6ONNeU1", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/e_iHep06jqk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Under soil and dirt")


        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    // needed to recycle cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
          
            return cell
        } else {
        
        return UITableViewCell()
        
        }
    }
    
    // how many cells do you need in you view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
        
    }
    
    //get the selected row and segue 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }


}

