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
        FHIRManager.instance.getPerson()
        FHIRManager.instance.getConditions("1551992")
      
    }
}