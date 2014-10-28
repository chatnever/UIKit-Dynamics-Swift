//
//  PendulumComposite.swift
//  UIKit Dynamics Catalog
//
//  Created by Dũng Bé O on 10/28/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class PendulumComposite: UIViewController {

    var attachmentPoint : UIImageView!
    var box1 : UIImageView!
    var animator : UIDynamicAnimator!
    var pendulumBehavior : UIDCPendulumBehavior!
    
    
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
        
        self.box1 = UIImageView(image:UIImage(named:"box1"))
        self.attachmentPoint = UIImageView(image:UIImage(named:"AttachmentPoint_Mask"))
        
        self.box1.center = CGPointMake(self.view.center.x, 320)
        self.attachmentPoint.center = CGPointMake(self.view.center.x, 170)
        
        self.view.addSubview(self.box1)
        self.view.addSubview(self.attachmentPoint)
        
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        self.attachmentPoint.tintColor = UIColor.redColor()
        self.attachmentPoint.image = self.attachmentPoint.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        // Visually show the connection between the attachmentPoint and the square.
//        (self.view as UIDCDecorationView).trackAndDrawAttachmentFromView(self.attachmentPoint, toView:self.box1, withAttachmentOffset:CGPointMake(0, -0.95 * self.box1.bounds.size.height/2))
        
        
        let pendulumAttachmentPoint:CGPoint = self.attachmentPoint.center
        
        // An example of a high-level behavior simulating a simple pendulum.
        let pendulumBehavior:UIDCPendulumBehavior = UIDCPendulumBehavior(weight:self.box1, suspendedFromPoint:pendulumAttachmentPoint)
        
        animator.addBehavior(pendulumBehavior)
        
        self.pendulumBehavior = pendulumBehavior
        
        self.animator = animator
    }


    @IBAction func handlePanGesture(sender: UIPanGestureRecognizer) {
        if (sender.state == UIGestureRecognizerState.Began)
        {
            self.pendulumBehavior.beginDraggingWeightAtPoint(sender.locationInView(self.view))
        }
        else if (sender.state == UIGestureRecognizerState.Ended)
        {
            self.pendulumBehavior.endDraggingWeightWithVelocity(sender.velocityInView(self.view))
        }
        else if (sender.state == UIGestureRecognizerState.Cancelled)
        {
            sender.enabled = true;
            self.pendulumBehavior.endDraggingWeightWithVelocity(sender.velocityInView(self.view))
        }
        else if (!CGRectContainsPoint(self.box1.bounds, sender.locationInView(self.box1)))
        {
            // End the gesture if the user's finger moved outside square1's bounds.
            // This causes the gesture to transition to the cencelled state.
            sender.enabled = false;
        }
        else
        {
            self.pendulumBehavior.dragWeightToPoint(sender.locationInView(self.view))
        }
    }
}
