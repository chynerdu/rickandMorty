//
//  EpisodesTableViewController.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 29/11/2023.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var episodesList = [Episode]()
    var currentOffset: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            
            do {
                activityIndicator.isHidden = false
                activityIndicator.startAnimating()
                let result = try await EpisodesAPI_Helper.fetchEpisodes()
                episodesList = result.results
                currentOffset += 20
                tableView.reloadData()
                activityIndicator.stopAnimating()


               
            } catch {
                print(error)
            }

        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodesTableViewCell

               // Configure the cell...
               let episode = episodesList[indexPath.row]
        
               cell.nameLabel!.text = episode.name
        cell.airDateLabel!.text = episode.air_date
       
       
               return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row + 1 == episodesList.count - 10 {
            // fetch more pokemone
            print("fetch more episodes")
            Task {
                do {
                    let result = try await EpisodesAPI_Helper.fetchEpisodes(offset: currentOffset)
                    episodesList.append(contentsOf: result.results)
                    currentOffset += 20
                    tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
