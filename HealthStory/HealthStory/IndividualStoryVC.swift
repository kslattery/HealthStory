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
  
  var fM : FamilyMember?
  var id : String = ""
  var selectedConditionsArray : [String] = []
  
  func onSelectionChange() {
     if self.selectedConditionsArray.count > 0 {
      print(self.selectedConditionsArray.count)
    }
  }
  
  override func viewDidLoad() {
    name.text = fM?.name
    picture.image = fM?.image
    id = (fM?.id)!
    
    //make the call to the API
  }
  
  override func viewDidAppear(animated: Bool) {

  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "goToH" {
      let vc = segue.destinationViewController as! SelectHighlightVC
      vc.prevVC = self
    }
  }
}

