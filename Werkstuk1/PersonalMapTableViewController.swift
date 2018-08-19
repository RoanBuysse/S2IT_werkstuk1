
//  PersonalMapTableViewController.swift
//  MyPersonApp
//
//  Created by Roan Buysse on 18/08/2018.
//  Copyright © 2018 Apple Inc. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation


class PersonalMapTableViewController: UITableViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
  
    @IBOutlet weak var mapview: MKMapView!
    
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kaart"

        loadSampleData()
        print(people)
        mapview.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Check for Location Services
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            mapview.showsUserLocation=true;
        }
        
        for person in people{
            let location = CLLocationCoordinate2DMake(person.lattitude!, person.longitude!)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = "locatie van: " + (person.naam!)
            mapview.addAnnotation(dropPin)
        }
    }
    
    // MARK - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        
        if currentLocation == nil {
            // Zoom to user location
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000)
                mapview.setRegion(viewRegion, animated: false)
            }
        }
    }
    
    func loadSampleData() {
        let person1 = Person(naam: "De Dom Tom", image: UIImage(named: "Sample1"), straat: "kerkstraat", huisnummer: "5",  postcode: "9080", gemeente: "Lochristi", longitude: 3.827135, lattitude: 51.129885, telefoonNummer: "0499665110" )
        let person2 = Person(naam: "de Ree Ivo", image: UIImage(named: "Sample3"), straat: "kerkstraat", huisnummer: "4",  postcode: "9000", gemeente: "Brussel", longitude: 4.627135, lattitude: 50.129885, telefoonNummer: "0499665110" )
        let person3 = Person(naam: "Verstraete Kaat", image: UIImage(named: "Sample2"), straat: "kerkstraat", huisnummer: "2",  postcode: "1060", gemeente: "Antwerpe,", longitude: 2.37135, lattitude: 52.429885, telefoonNummer: "04944225110" )
        
        
        
        people = [person1, person2, person3]
        tableView.reloadData()
        
    }
}



