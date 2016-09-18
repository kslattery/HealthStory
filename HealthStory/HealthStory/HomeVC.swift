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


class Condition {
  
}

class ConditionWrapper {
  var condition: [Condition]?
}


class HomeVC : UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var tableView:UITableView?
  var items : [String] = []
  
  override func viewWillAppear(animated: Bool) {
    let frame:CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
    self.tableView = UITableView(frame: frame)
    self.tableView?.dataSource = self
    self.tableView?.delegate = self
    self.view.addSubview(self.tableView!)
    self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    let btn = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.width, height: 50))
    btn.backgroundColor = UIColor.cyanColor()
    btn.setTitle("Add new Dummy", forState: UIControlState.Normal)
    btn.addTarget(self, action: "addDummyData", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(btn)
  }
  
  
  func addDummyData() {
    FHIRManager.instance.getConditions("1551992") { json in
      let conditions = json["entry"]
      for condition in conditions {
        let coding = condition.1["resource"]["code"]["coding"]
        for entry in coding {
          print(entry.1["display"])
          self.items.append("\(entry.1["display"])")
          
        }
      }
      dispatch_async(dispatch_get_main_queue(),{
        self.tableView?.reloadData()
      })
      
      
      
    }
  }

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return self.items.count
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  
  let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

  let currentCondition = self.items[indexPath.row]
  cell.textLabel?.text = currentCondition

  
  return cell
}

override func viewDidLoad() {
  super.viewDidLoad()
  FHIRManager.instance.getPerson()
  let conditions : JSON
  //       FHIRManager.instance.getConditions("1551992", onCompletion: conditions)
  FHIRManager.instance.getProcedures("1551992")
  FHIRManager.instance.getMedicationStatement("1551992")
}

}
