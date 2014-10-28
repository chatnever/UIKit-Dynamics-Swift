//
//  Gravity.swift
//  UIKit Dynamics Catalog
//
//  Created by Dũng Bé O on 10/27/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class Gravity: UIViewController {

    @IBOutlet weak var box: UIImageView!
    var animator : UIDynamicAnimator!
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        let gravityBeahvior:UIGravityBehavior = UIGravityBehavior(items:[self.box]);
        animator.addBehavior(gravityBeahvior)
        
        self.animator = animator
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }


}
