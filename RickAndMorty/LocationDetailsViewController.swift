//
//  LocationDetailsViewController.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 11/12/2023.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    var location: Location!
    var locationDetails: LocationDetails!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    @IBOutlet weak var residentsLabel: UILabel!
    @IBOutlet weak var createdlabel: UILabel!
 
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = location.name
        nameLabel.text = ""
        typeLabel.text = ""
        dimensionLabel.text = ""
        residentsLabel.text = ""
        createdlabel.text = ""
        
        Task {
            do{
                spinner.isHidden = false
                spinner.startAnimating()
                locationDetails = try await LocationAPI_Helper.fetchLocationDetails(urlString: location.url)
                
                print(locationDetails.name)
                nameLabel.text = String(locationDetails.name)
                typeLabel.text = String(locationDetails.type)
                dimensionLabel.text = String(locationDetails.dimension)
                createdlabel.text = String(locationDetails.created)
                residentsLabel.text = String(locationDetails.residents.count)
                
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
