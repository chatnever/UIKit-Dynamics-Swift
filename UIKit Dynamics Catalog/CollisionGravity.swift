//
//  CollisionGravity.swift
//  UIKit Dynamics Catalog
//
//  Created by Dũng Bé O on 10/27/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class CollisionGravity: UIViewController {

    @IBOutlet weak var box: UIImageView!
    var animator : UIDynamicAnimator!
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        let gravityBeahvior:UIGravityBehavior = UIGravityBehavior(items:[self.box])
        animator.addBehavior(gravityBeahvior)
        
        
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items:[self.box])
 
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true;
//        collisionBehavior.collsionDelegate = self
        animator.addBehavior(collisionBehavior)
        
        self.animator = animator;
    }

    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint)
    {
        (item as UIView).tintColor = UIColor.lightGrayColor()
    }
    
    
    func collisionBehavior(behavior: UICollisionBehavior!, endedContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!)
        
    {

        (item as UIView).tintColor = UIColor.darkGrayColor()
    }
    
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.box.image = self.box.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        self.box.tintColor = UIColor.darkGrayColor();
    }

}
