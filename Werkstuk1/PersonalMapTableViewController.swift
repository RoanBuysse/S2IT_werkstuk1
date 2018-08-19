//
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}


