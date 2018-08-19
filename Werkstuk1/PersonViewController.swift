//
//  PersonViewController.swift
//  PersonRoan
//
//  Created by Roan Buysse on 1/04/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import MapKit


class PersonViewController: UITableViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
       var person: Person?
    
    


    
    @IBOutlet weak var NaamLabel: UILabel!
    @IBOutlet weak var StraatLabel: UILabel!
    @IBOutlet weak var NummerLabel: UILabel!
    @IBOutlet weak var PostcodeLabel: UILabel!
    @IBOutlet weak var GemeenteLabel: UILabel!
    @IBOutlet weak var TelefoonnummerLabel: UILabel!
    @IBOutlet weak var imageButtonc: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the views if editing an existing person.
       
        if let person = person {
                       NaamLabel.text=person.naam
                       StraatLabel.text=person.straat
                        NummerLabel.text=person.huisnummer
                        PostcodeLabel.text=person.postcode
                        GemeenteLabel.text=person.gemeente
                        TelefoonnummerLabel.text=person.telefoonNummer
                        imageButtonc.setImage(person.image, for: [])
                                      }
        let initialLocation = CLLocation(latitude: person!.lattitude!, longitude: person!.longitude!)
        centerMapOnLocation(location: initialLocation)
        
        let location = CLLocationCoordinate2DMake(person!.lattitude!, person!.longitude!)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = "locatie van: " + (person?.naam!)!
        mapView.addAnnotation(dropPin)
               }
    
    
    
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        //pin
        

   
    
   }

}
