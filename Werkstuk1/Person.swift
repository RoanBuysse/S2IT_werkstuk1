
//
//  Person.swift
//  PersonRoan
//
//  Created by Roan Buysse on 1/04/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
import UIKit

/// This class defines the data that is stored for each person.
class Person {
    
    var naam: String?

    var image: UIImage?
    var straat: String?
    var huisnummer: String?
    var postcode: String?
    var gemeente: String?
    var lattitude: Double?
    var longitude: Double?
    
    var telefoonNummer: String?
    
    
    
    init(naam: String? = nil, voornaam: String? = nil, image: UIImage? = nil, straat: String? = nil, huisnummer: String? = nil, postcode: String? = nil, gemeente: String? = nil, longitude: Double? = nil, lattitude: Double? = nil, telefoonNummer: String? = nil) {
        self.naam = naam
        self.image = image
        self.straat = straat
        self.huisnummer = huisnummer
        self.postcode = postcode
        self.gemeente = gemeente
        self.lattitude = lattitude
        self.longitude = longitude
        self.telefoonNummer = telefoonNummer
    }
}
