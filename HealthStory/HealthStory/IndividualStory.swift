//
//  IndividualStory.swift
//  HealthStory
//
//  Created by Kevin Slattery on 9/17/16.
//  Copyright © 2016 StoryTellers. All rights reserved.
//

import Foundation

class IndividualStory: NSObject {
    var userName: String?
    
    
    func initialize(user_name: String) {
        userName = user_name
    }

    func retrieveConditionList () {
        // Retrieve list of conditions from FHIR
    }
    
    func addConditionToStory () {
        
    }
}

