//
//  PeopleTableViewController.swift
//  PersonRoan
//
//  Created by Roan Buysse on 1/04/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//


import UIKit
import MapKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Personlabel: UILabel!
    @IBOutlet weak var PersonImage: UIImageView!
}


class PeopleTableViewController: UITableViewController {
    // MARK: Properties

    // Setup the initial array of people.
    var people = [Person]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()        
        title = "Personen"
    }


   
    func loadSampleData() {
               let person1 = Person(naam: "De Dom Tom", image: UIImage(named: "Sample1"), straat: "kerkstraat", huisnummer: "5",  postcode: "9080", gemeente: "Lochristi", longitude: 3.827135, lattitude: 51.129885, telefoonNummer: "0499665110" )
        let person2 = Person(naam: "de Ree Ivo", image: UIImage(named: "Sample3"), straat: "kerkstraat", huisnummer: "4",  postcode: "9000", gemeente: "Brussel", longitude: 4.627135, lattitude: 50.129885, telefoonNummer: "0499665110" )
        let person3 = Person(naam: "Verstraete Kaat", image: UIImage(named: "Sample2"), straat: "kerkstraat", huisnummer: "2",  postcode: "1060", gemeente: "Antwerpe,", longitude: 2.37135, lattitude: 52.429885, telefoonNummer: "04944225110" )

        

        people = [person1, person2, person3]
        tableView.reloadData()
    }
    
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We only have a single section and want one row per person.
        return people.count
    }
    
    
    /// The table view calls this method to set up each cell in the table for display.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          // Ask the table view to create a cell for us to use to show a person.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! PersonTableViewCell
        
        // Get the person we are displaying for this row.
        let person = people[indexPath.row]
        
        // Set the text and image in the cell.
        cell.textLabel!.text = person.naam

        cell.imageView!.image = person.image
        
        // Now the cell has been setup, return it to the table view.
        return cell
    }
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPersonSegue" {
            let destinationController = segue.destination as! PersonViewController
            let selectedTableCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: selectedTableCell)
            let person = people[indexPath!.row]
            destinationController.person = person
        }
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }

   
       }


