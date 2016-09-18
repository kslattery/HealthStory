//
//  IndividualStory.swift
//  HealthStory
//
//  Created by Kevin Slattery on 9/17/16.
//  Copyright © 2016 StoryTellers. All rights reserved.
//

import UIKit

class IndividualStoryVC: UIViewController {
    
    // outlets
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var highlights: UITableView!
    
    var fM : FamilyMember?
    var id : String = ""
    var selectedConditionsArray : [String] = []
    var selectedConditionDatesArray : [String] = []
    
    func onSelectionChange() {
        if self.selectedConditionsArray.count > 0 {
            print(self.selectedConditionsArray.count)
            highlights.reloadData()
        }
    }
    
    override func viewDidLoad() {
        name.text = fM?.name
        picture.image = fM?.image
        id = (fM?.id)!
        
        highlights.delegate = self
        highlights.dataSource = self
        
        //make the call to the API
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToH" {
            let vc = segue.destinationViewController as! SelectHighlightVC
            vc.prevVC = self
            vc.personID = id
        }
    }
}

extension IndividualStoryVC : UITableViewDelegate, UITableViewDataSource {
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedConditionsArray.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyConditionCell
        
        let currentCondition = self.selectedConditionsArray[indexPath.row]
        let currentConditionDate = self.selectedConditionDatesArray[indexPath.row]
        cell.theDate.text = currentConditionDate
        cell.theEvent.text = currentCondition
        
        return cell
    }
    
}

class MyConditionCell : UITableViewCell {

    @IBOutlet weak var theDate: UILabel!
    @IBOutlet weak var theEvent: UILabel!
    
}
