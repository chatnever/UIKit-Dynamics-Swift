//
//  Snap.swift
//  UIKit Dynamics Catalog
//
//  Created by Dũng Bé O on 10/28/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class Snap: UIViewController {

    @IBOutlet weak var box: UIImageView!
    var animator : UIDynamicAnimator!
    //! Reference to the previously applied snap behavior.
    var snapBehavior:UISnapBehavior!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        self.animator = animator
    }

    @IBAction func handleSnapGesture(sender: UITapGestureRecognizer) {
        var point:CGPoint = sender.locationInView(self.view)
        
        // Remove the previous behavior.
        self.animator!.removeBehavior(self.snapBehavior)
        
        var snapBehavior:UISnapBehavior = UISnapBehavior(item:self.box, snapToPoint:point)
        self.animator!.addBehavior(snapBehavior)
        
        self.snapBehavior = snapBehavior
    }

}
