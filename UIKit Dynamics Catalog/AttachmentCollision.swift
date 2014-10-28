//
//  AttachmentCollision.swift
//  UIKit Dynamics Catalog
//
//  Created by Dũng Bé O on 10/27/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class AttachmentCollision: UIViewController {

    @IBOutlet weak var square1: UIImageView!
    @IBOutlet weak var square2: UIImageView!
    @IBOutlet weak var attachmentView: UIImageView! 

    var animator : UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    
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
        
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items:[self.square1])
        // Creates collision boundaries from the bounds of the dynamic animator's
        // reference view (self.view).
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
        
        let squareCenterPoint:CGPoint = CGPointMake(self.square1.center.x, self.square1.center.y - 110.0)
        let attachmentPoint:UIOffset = UIOffsetMake(-25.0, -25.0);
        // By default, an attachment behavior uses the center of a view. By using a
        // small offset, we get a more interesting effect which will cause the view
        // to have rotation movement when dragging the attachment.
        
        let attachmentBehavior:UIAttachmentBehavior = UIAttachmentBehavior(item:self.square1, offsetFromCenter:attachmentPoint, attachedToAnchor:squareCenterPoint)
        
        animator.addBehavior(attachmentBehavior)
        self.attachmentBehavior = attachmentBehavior
        
        // Visually show the attachment points
        self.attachmentView.center = attachmentBehavior.anchorPoint
        self.attachmentView.tintColor = UIColor.redColor()
        self.attachmentView.image = self.attachmentView.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        self.square2.center = CGPointMake(25.0, 25.0)
        self.square2.tintColor = UIColor.blueColor()
        self.square2.image = self.square2.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        // Visually show the connection between the attachment points.
//        (self.view as UIDCDecorationView).trackAndDrawAttachmentFromView(self.attachmentView, toView:self.square1, withAttachmentOffset:CGPointMake(-25.0, -25.0));
        
        self.animator = animator;
        
        
    }
    

    

    @IBAction func handleAttachmentGesture(sender: UIPanGestureRecognizer) {
        
        self.attachmentBehavior!.anchorPoint = sender.locationInView(self.view)
        self.attachmentView.center = self.attachmentBehavior!.anchorPoint
        
        print("aaaa->")
        println(self.attachmentView)
        print("bbbb->")
        println(self.square1)
        
    }



}
