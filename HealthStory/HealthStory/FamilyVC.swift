//
//  File.swift
//  HealthStory
//
//  Created by Santi on 9/18/16.
//  Copyright © 2016 StoryTellers. All rights reserved.
//

import UIKit


struct FamilyMember {
  var name : String
  var image : UIImage?
}

class FamilyVC : UIViewController {
  
  var family : [FamilyMember] = []
  
  
  override func viewDidLoad() {
    
    family[0] = FamilyMember(name: "Kevin", image: UIImage(named: "theGuy"))
    family[1] = FamilyMember(name: "Emilie", image: UIImage(named: "theGuy"))
    family[2] = FamilyMember(name: "Katie", image: UIImage(named: "theGuy"))
    family[3] = FamilyMember(name: "Seamus", image: UIImage(named: "theGuy"))
    family[4] = FamilyMember(name: "Nora", image: UIImage(named: "theGuy"))
    
    
    
  }
  
}

extension FamilyVC : UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return family.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("familycell", forIndexPath: indexPath) as! CellGuy
    
    cell.guyPicture.image = family[indexPath.row].image
    cell.guyName.text = family[indexPath.row].name

    return cell
  }
  
  
  
}

class CellGuy : UICollectionViewCell {
  
  @IBOutlet weak var guyPicture: UIImageView!
  @IBOutlet weak var guyName: UILabel!
  
}
