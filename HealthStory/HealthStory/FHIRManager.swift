//
//  FHIRManager.swift
//  HealthStory
//
//  Created by Kevin Slattery on 9/17/16.
//  Copyright © 2016 StoryTellers. All rights reserved.
//

import Alamofire
import SwiftyJSON


class FHIRManager {
    
    static let instance = FHIRManager()
    let headers = kAPIHEADER
    var url = kAPIURL
    
    func getConditions (personID: NSString, onCompletion: (JSON) -> Void) {
        let conditionsURL = url + "/Condition"
        
        Alamofire.request(.GET, conditionsURL, parameters: ["patient":personID], headers: headers).responseJSON { response in
            
            
            if let status = response.response?.statusCode {
                let json:JSON = JSON(data: response.data!)
                if status == 200 {
                    print(response)
                    onCompletion(json as JSON)
                }
                else {
                    if let message = json["detail"].string {
                        print(message)
                    }
                    else {
                        print("No known error")
                    }
                }
            } else {
                print("no valid status code")
                print(response)
            }
        }
    }
    
    
    
    func getPerson() {
        let personURL = url + "/Patient"
        
        Alamofire.request(.GET, personURL, parameters: ["name":"Coleman"], headers: headers).responseJSON { response in
            
            
            if let status = response.response?.statusCode {
                let json = JSON(data: response.data!)
                if status == 200 {
                    print(response)
                }
                else {
                    if let message = json["detail"].string {
                        print(message)
                    }
                    else {
                        print("No known error")
                    }
                }
            } else {
                print("no valid status code")
                print(response)
            }
        }
    }
    
    //Alternate meds API: MedicationPrescription
    func getMedicationStatement(personID: NSString) {
        let medicationsURL = url + "/MedicationStatement"
        
        Alamofire.request(.GET, medicationsURL, parameters: ["patient":personID], headers: headers).responseJSON { response in
            
            
            if let status = response.response?.statusCode {
                let json = JSON(data: response.data!)
                if status == 200 {
                    print(response)
                }
                else {
                    if let message = json["detail"].string {
                        print(message)
                    }
                    else {
                        print("No known error")
                    }
                }
            } else {
                print("no valid status code")
                print(response)
            }
        }
        
    }
    
    func getProcedures (personID: NSString) {
        let proceduresURL = url + "/Procedure"
        
        Alamofire.request(.GET, proceduresURL, parameters: ["patient":personID], headers: headers).responseJSON { response in
            
            
            if let status = response.response?.statusCode {
                let json = JSON(data: response.data!)
                if status == 200 {
                    print(response)
                }
                else {
                    if let message = json["detail"].string {
                        print(message)
                    }
                    else {
                        print("No known error")
                    }
                }
            } else {
                print("no valid status code")
                print(response)
            }
        }
        
        
    }
    
}

