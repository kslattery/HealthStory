//
//  HomeVC.swift
//  HealthStory
//
//  Created by Santi on 9/17/16.
//  Copyright © 2016 StoryTellers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeVC : UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    Alamofire.request(.GET, "https://fhir-open-api.dstu2.smarthealthit.org/Patient", parameters: ["name":"Coleman"]).responseJSON { response in
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