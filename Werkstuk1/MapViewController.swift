//
//  MapViewController.swift
//  PersonRoan
//
//  Created by Roan Buysse on 1/04/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var LocatieMap: MKMapView!
    var locationManager: CLLocationManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            LocatieMap.userTrackingMode = .follow

            
        }
       
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        let location = locations.last as! CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        self.LocatieMap.setRegion(region, animated: true)
        
        

        
    
    }
    
   
    
    
    /*func getMapAnnotations() -&gt; [Person] {
    var annotations:Array = [People]()
    
    //load plist file
    var stations: NSArray?
    if let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
    stations = NSArray(contentsOfFile: path)
    }
    
    //iterate and create annotations
    if let items = stations {
    for item in items {
    let lat = item.valueForKey("lat") as! Double
    let long = item.valueForKey("long")as! Double
    let annotation = Station(latitude: lat, longitude: long)
    annotation.title = item.valueForKey("title") as? String
    annotations.append(annotation)
    }
    }
    
    return annotations
    }

*/
    
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      }
