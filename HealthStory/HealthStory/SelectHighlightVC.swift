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


class SelectHighlightVC : UIViewController {
    
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var prevVC : IndividualStoryVC?
    
    var items : [String] = []
    var itemDates : [String] = []
    var selectedConditionsArray : [String] = []
    var selectedConditionDatesArray : [String] = []
    
    override func viewWillAppear(animated: Bool) {
        addFHIRData()
    }
    
    @IBAction func btnPress(sender: AnyObject) {
        prevVC?.selectedConditionsArray = self.selectedConditionsArray
        prevVC?.selectedConditionDatesArray = self.selectedConditionDatesArray
        prevVC?.onSelectionChange()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func addFHIRData() {
        // Patient IDs:
        // Male adult 967332
        // Female adult 1551992
        // Female child 1032702
        // Female child 1134281
        // Male child 99912345
        //
        FHIRManager.instance.getConditions("1551992") { json in
            let conditions = json["entry"]
            for condition in conditions {
                let coding = condition.1["resource"]["code"]["coding"]
                for entry in coding {
                    //print(entry.1["display"])
                    self.items.append("\(entry.1["display"])")
                    self.itemDates.append("9/3/2016")
                }
            }
            dispatch_async(dispatch_get_main_queue(),{
                print(self.items.count)
                self.tableView.reloadData()
            })
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
}

extension SelectHighlightVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyConditionCell2
        
        //cell.textLabel?.text = self.items[indexPath.row]
        
        cell.theDate?.text = self.itemDates[indexPath.row]
        cell.theEvent?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView:UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if let selectedRow = tableView.cellForRowAtIndexPath(indexPath) as? MyConditionCell2 {
            if selectedRow.accessoryType == .None {
                selectedRow.accessoryType = .Checkmark
                selectedConditionsArray.append((selectedRow.theEvent?.text)!)
                selectedConditionDatesArray.append((selectedRow.theDate?.text)!)
            }
            else {
                selectedRow.accessoryType = .None
                let indexToRemove = selectedConditionsArray.indexOf((selectedRow.theEvent?.text)!)
                selectedConditionsArray.removeAtIndex(indexToRemove!)
                selectedConditionDatesArray.removeAtIndex(indexToRemove!)
            }
        }
    }
    
    
}

class MyConditionCell2 : UITableViewCell {
    @IBOutlet weak var theDate: UILabel!
    @IBOutlet weak var theEvent: UILabel!
    
    
}
