//
//  EpisodeDetailsViewController.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 11/12/2023.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {
    var epsisode: Episode!
    var episodeDetails: EpisodeDetails!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var createdlabel: UILabel!
    @IBOutlet weak var characters: UILabel!
 
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = epsisode.name
        nameLabel.text = ""
        airDateLabel.text = ""
        episodeLabel.text = ""
        createdlabel.text = ""
        characters.text = ""
        
        Task {
            do{
                spinner.isHidden = false
                spinner.startAnimating()
                episodeDetails = try await EpisodesAPI_Helper.fetchEpisodesDetails(urlString: epsisode.url)
                
                print(episodeDetails.name)
                nameLabel.text = String(episodeDetails.name)
                airDateLabel.text = String(episodeDetails.air_date)
                episodeLabel.text = String(episodeDetails.episode)
                createdlabel.text = String(episodeDetails.created)
                characters.text = String(episodeDetails.characters.count)
                
                spinner.stopAnimating()
            } catch {
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
