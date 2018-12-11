//
//  BusanData.swift
//  BusanMap02
//
//  Created by D7703_24 on 2018. 10. 30..
//  Copyright © 2018년 D7703_24. All rights reserved.
//

import Foundation
import MapKit
class BusanData: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
}

