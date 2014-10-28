//
//  ContinousPush.swift
//  UIKit Dynamics Catalog
//
//  Created by Dũng Bé O on 10/28/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class ContinousPush: UIViewController {

    @IBOutlet weak var box: UIImageView!
    var animator : UIDynamicAnimator!
    var pushBehavior:UIPushBehavior!
    
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
    }
    
    //| ----------------------------------------------------------------------------
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        var collisionBehavior:UICollisionBehavior = UICollisionBehavior(items:[self.box])
        // Account for any top and bottom bars when setting up the reference bounds.
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsetsMake(self.topLayoutGuide.length, 0, self.bottomLayoutGuide.length, 0))
        animator.addBehavior(collisionBehavior)
        
        var pushBehavior:UIPushBehavior = UIPushBehavior(items:[self.box], mode:UIPushBehaviorMode.Continuous)
        pushBehavior.angle = 0.0
        pushBehavior.magnitude = 0.0
        animator.addBehavior(pushBehavior)
        self.pushBehavior = pushBehavior
        
        self.animator = animator
    }

    @IBAction func handlePushContinousGesture(sender: UITapGestureRecognizer) {
        var p:CGPoint = sender.locationInView(self.view)
        var o:CGPoint = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))
        var distance:CGFloat = CGFloat(sqrtf(powf(Float(p.x)-Float(o.x), 2.0)+powf(Float(p.y)-Float(o.y), 2.0)))
        var angle:CGFloat = CGFloat(atan2(CDouble(p.y-o.y), CDouble(p.x-o.x)))
        distance = min(distance, 200.0)
        
        // Display an arrow showing the direction and magnitude of the applied force.
//        (self.view as UIDCDecorationView).drawMagnitudeVector(distance, angle:angle, color:UIColor.redColor(), forLimitedTime:false)
        
        // These two lignes change the actual force vector.
        self.pushBehavior!.magnitude = distance / 100.0
        self.pushBehavior!.angle = angle
    }

}
