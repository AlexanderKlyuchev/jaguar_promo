//
//  ResultsGestogrameController.swift
//  JaguarPromo
//
//  Created by Александр Ключев on 6/8/16.
//  Copyright © 2016 Александр Ключев. All rights reserved.
//

import UIKit

class ScannerViewController: UIViewController {
    
    var m_pressed_btns:Int=0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let bg_view = UIImageView.init(frame: self.view.frame);
        bg_view.image = UIImage.init(named: "scan_back")
        
        
        self.view.addSubview(bg_view);
        
        let center_btn=UIButton()
        
        let rect=self.view.frame;
        center_btn.frame=CGRectMake(rect.size.width/3, rect.size.height/2,  250, 250)
        
        center_btn.setImage(UIImage(named:"scan_bg_big_btn"), forState: UIControlState.Normal)
        
        let btn1=UIButton()
        let btn2=UIButton();
        let btn3=UIButton()
        let btn4=UIButton();
        let btn5=UIButton()
        
        btn1.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        btn1.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        btn2.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        btn2.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        btn2.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        btn2.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        
        btn3.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        btn3.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        btn4.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        btn4.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        btn5.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        btn5.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        
        center_btn.addTarget(self, action: #selector(ScannerViewController.holdRelease(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        center_btn.addTarget(self, action: #selector(ScannerViewController.HoldDown(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        
        btn1.backgroundColor=UIColor.whiteColor()
        btn1.layer.cornerRadius=30;
        btn1.frame=CGRectMake(rect.size.width/4.7, rect.size.height/4.5,  60, 60)
        
        btn2.backgroundColor=UIColor.whiteColor()
        btn2.layer.cornerRadius=30;
        btn2.frame=CGRectMake(rect.size.width/2.9, rect.size.height/8,  60, 60)
        
        btn3.backgroundColor=UIColor.whiteColor()
        btn3.layer.cornerRadius=30;
        btn3.frame=CGRectMake(rect.size.width/2.1, rect.size.height/8,  60, 60)
        
        btn4.backgroundColor=UIColor.whiteColor()
        btn4.layer.cornerRadius=30;
        btn4.frame=CGRectMake(rect.size.width/1.65, rect.size.height/5.5,  60, 60)
        
        btn5.backgroundColor=UIColor.whiteColor()
        btn5.layer.cornerRadius=30;
        btn5.frame=CGRectMake(rect.size.width/1.2, rect.size.height/1.5,  60, 60)
        
        
        self.view.addSubview(center_btn)
        self.view.addSubview(btn1);
        self.view.addSubview(btn2);
        self.view.addSubview(btn3);
        self.view.addSubview(btn4);
        self.view.addSubview(btn5);
        
        
    }
    
    //target functions
    func HoldDown(sender:UIButton)
    {
        m_pressed_btns += 1;
        
        if(m_pressed_btns == 1){
            let vc=QuestionsViewController();
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    func holdRelease(sender:UIButton)
    {
        m_pressed_btns -= 1;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
