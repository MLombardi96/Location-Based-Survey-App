//
//  SurveyQuestionsViewController.swift
//  LocationBasedSurveyApp
//
//  Created by Jason West on 12/28/17.
//  Copyright © 2017 Mitchell Lombardi. All rights reserved.
//

import UIKit

class SurveyQuestionsViewController: UIViewController {
    
    @IBOutlet weak var surveyLabel: UILabel!
    
    var survey: Survey?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedSurvey = survey?.name {
            surveyLabel.text = selectedSurvey + " Questions"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
