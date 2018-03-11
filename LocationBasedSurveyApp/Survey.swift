//
//  Survey.swift
//  LocationBasedSurveyApp
//
//  Created by Jason West on 12/22/17.
//  Copyright © 2017 Mitchell Lombardi. All rights reserved.
//

import Foundation
import CoreLocation

/****
 * Survey Data Model
 ***/
class Survey {
    
    //let locationNotification = LocationNotification()
    
    //MARK: Properties
    var id: String?
    var name: String
    //var shortDescription: String // Used when the survey questions are available
    var latitude: Double
    var longitude: Double
    var radius: Double
    var isSelected = false
    var isComplete = false
    
    var center: CLLocationCoordinate2D
    var region: CLCircularRegion
 
    //MARK: Initialization
    init?(_ survey: inout Root.Survey) {
        
        self.id = survey.ID
        self.name = survey.Name
        self.latitude = survey.LatLng[0]
        self.longitude = survey.LatLng[1]
        self.radius = survey.Radius
        self.center = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        self.region = CLCircularRegion(center: self.center, radius: self.radius, identifier: self.id!)
        //self.shortDescription = survey.Description
    }
    
    // Constructor for an empty survey
    init() {
        self.id = nil
        self.name = "No History"
        self.latitude = 0
        self.longitude = 0
        self.radius = 0
        self.center = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        self.region = CLCircularRegion(center: self.center, radius: self.radius, identifier: "Empty")
    }
    
}
