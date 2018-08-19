//
//  CenterPin.swift
//  PersonRoan
//
//  Created by Roan Buysse on 14/05/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class CenterPin:  NSObject,MKAnnotation{
    var coordinate: CLLocation = initialLocation;
    var title: String? = "0,0 Street Numbers"
}
