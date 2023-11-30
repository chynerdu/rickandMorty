//
//  CharacterTableViewController.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 30/11/2023.
//

import UIKit

class CharacterTableViewController: UITableViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var characterList = [Character]()
    var currentOffset: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            
            do {
                activityIndicator.isHidden = false
                activityIndicator.startAnimating()
                let result = try await CharactersAPI_Helper.fetchCharacters()
                characterList = result.results
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
        return characterList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell

               // Configure the cell...
               let character = characterList[indexPath.row]
        
               cell.nameLabel!.text = character.name
        cell.specieLabel!.text = character.species
        cell.statusLabel!.text = character.status
       
       
               return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row + 1 == characterList.count - 10 {
            // fetch more pokemone
            print("fetch more episodes")
            Task {
                do {
                    let result = try await  CharactersAPI_Helper.fetchCharacters(offset: currentOffset)
                    characterList.append(contentsOf: result.results)
                    currentOffset += 20
                    tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
    }

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
