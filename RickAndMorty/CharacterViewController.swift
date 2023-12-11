//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 11/12/2023.
//

import UIKit

class CharacterViewController: UIViewController {
    var character: Character!
    var characterDetails: CharacterDetails!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderlabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = character.name
        nameLabel.text = ""
        statusLabel.text = ""
        speciesLabel.text = ""
        genderlabel.text = ""
        
        Task {
            do{
                spinner.isHidden = false
                spinner.startAnimating()
                characterDetails = try await CharactersAPI_Helper.fetchCharacterDetails(urlString: character.url)
                
                print(characterDetails.name)
                nameLabel.text = String(characterDetails.name)
                statusLabel.text = String(characterDetails.status)
                speciesLabel.text = String(characterDetails.species)
                genderlabel.text = String(characterDetails.gender)
              
                
              
                    let imageData = try await CharactersAPI_Helper.fetchCharacterImage(urlSring: String(characterDetails.image))
                    
                    imageLabel.image = UIImage(data: imageData)
            
                
                
                
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
