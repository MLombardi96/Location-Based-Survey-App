//
//  Survey.swift
//  LocationBasedSurveyApp
//
//  Created by Jason West on 4/11/18.
//  Copyright © 2018 Mitchell Lombardi. All rights reserved.
//

import UIKit
import CoreData

class Survey: NSManagedObject {
    
    // either finds existing survey or creates a new one in the database
    class func findOrCreateSurvey(matching surveyInfo: NewSurvey, in context: NSManagedObjectContext) throws -> Survey? {
        let request: NSFetchRequest<Survey> = Survey.fetchRequest()
        request.predicate = NSPredicate(format: "surveyID = %@", surveyInfo.surveyID)
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count == 1, "database inconsistency")
                return matches[0]
            }
        } catch {
            throw error
        }
        
        // otherwise, make new survey in database
        let survey = Survey(context: context)
        survey.fenceID = surveyInfo.fenceID
        survey.surveyID = surveyInfo.surveyID
        survey.name = surveyInfo.name
        survey.fenceName = surveyInfo.fenceName
        survey.latitude = surveyInfo.latitude
        survey.longitude = surveyInfo.longitude
        survey.radius = surveyInfo.radius
        survey.url = surveyInfo.url
        if surveyInfo.isSelected {
            survey.sectionName = "Ready to Complete"
        }
        return survey
        
    }
    
    // finds the survey in the database with the mathing fence id passed as a parameter
    class func findSurveyWithFenceID(_ identifier: String, in context: NSManagedObjectContext) throws -> [Survey] {
        let request: NSFetchRequest<Survey> = Survey.fetchRequest()
        request.predicate = NSPredicate(format: "fenceID = %@", identifier)
        
        do {
            let matchingSurvey = try context.fetch(request)
            return matchingSurvey
        } catch {
            throw error
        }
        
    }
    
    // finds the survey in the database with the matching survey id
    class func findSurveyWithSurveyID(_ identifier: String, in context: NSManagedObjectContext) throws -> [Survey] {
        let request: NSFetchRequest<Survey> = Survey.fetchRequest()
        request.predicate = NSPredicate(format: "surveyID = %@", identifier)
        do {
            let matchingSurvey = try context.fetch(request)
            return matchingSurvey
        } catch {
            throw error
        }
    }
    
    // Removes survey from the database, may not need to return but left it open, will remove all found surveys (should only be one)
    class func removeFromDatabaseWith(survey identifier: String, in context: NSManagedObjectContext) throws -> [Survey] {
        do {
            let surveys = try findSurveyWithSurveyID(identifier, in: context)
            for survey in surveys {
                context.delete(survey)
            }
            return surveys
        } catch {
            throw error
        }
    }
}
