//
//  NewSurvey.swift
//  LocationBasedSurveyApp
//
//  Created by Jason West on 4/11/18.
//  Copyright © 2018 Mitchell Lombardi. All rights reserved.
//

import Foundation
import CoreLocation

struct NewSurvey {
    
    //MARK: Properties
    var fenceID: String
    var surveyID: String
    var name: String
    var latitude: Double
    var longitude: Double
    var radius: Double
    var url: String
    var isSelected = false
    var isComplete = false
    var center: CLLocationCoordinate2D { get { return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude) } }
    var region: CLCircularRegion { get { return CLCircularRegion(center: self.center, radius: self.radius, identifier: self.fenceID) } }
    
}
