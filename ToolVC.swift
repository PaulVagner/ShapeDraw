//
//  ToolVC.swift
//  TouchDraw2
//
//  Created by Paul Vagner on 1/3/16.
//  Copyright © 2016 Paul Vagner. All rights reserved.
//

import UIKit

class ToolVC: UIViewController {
    
    @IBAction func chooseTool(button: UIButton) {
        
        print(button.tag)
        DrawData.mainData().chosenTool = button.tag
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 300, height: 175)
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
