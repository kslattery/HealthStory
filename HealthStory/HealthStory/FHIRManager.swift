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
  
  
  
  static func initialize() {
    let headers = kAPIHEADER
    var url = kAPIURL
    url += "/Patient"
    
    Alamofire.request(.GET, url, parameters: ["name":"Coleman"], headers: headers).responseJSON { response in
      
      
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

