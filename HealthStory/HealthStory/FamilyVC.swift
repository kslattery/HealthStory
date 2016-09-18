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
  
  @IBOutlet weak var familyCollectionView: UICollectionView!
  
  var family : [FamilyMember] = []
  
  override func viewDidLoad() {
  
  }
  
  
  override func viewDidAppear(animated: Bool) {
    
    familyCollectionView.dataSource = self
    familyCollectionView.delegate = self
    
    family.append(FamilyMember(name: "Kevin", image: UIImage(named: "theGuy")))
    family.append(FamilyMember(name: "Emilie", image: UIImage(named: "theGuy")))
    family.append(FamilyMember(name: "Katie", image: UIImage(named: "theGuy")))
    family.append(FamilyMember(name: "Seamus", image: UIImage(named: "theGuy")))
    family.append(FamilyMember(name: "Nora", image: UIImage(named: "theGuy")))
    
    familyCollectionView.reloadData()
    
  }
  
}

extension FamilyVC : UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return family.count
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
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
