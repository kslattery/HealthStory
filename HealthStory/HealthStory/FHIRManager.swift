//
//  FHIRManager.swift
//  HealthStory
//
//  Created by Kevin Slattery on 9/17/16.
//  Copyright © 2016 StoryTellers. All rights reserved.
//

import Foundation

import Alamofire
//import SwiftyJSON
import Alamofire_SwiftyJSON


class FHIRManager: NSObject
{
    func initialize() {
        Alamofire.request(.GET, "https://fhir-dstu2.smarthealthit.org/Patient", parameters: ["name": "Coleman"]).responseSwiftyJSON({ (request, response, json, error)})
            completionHandler: <#T##Response<JSON, NSError> -> Void#>)
        

            
            
//            .responseSwiftyJSON({ (request, response, json, error) in
//                println(json)
//                println(error)
//            })
    }
}

