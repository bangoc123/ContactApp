//
//  DetailVC.swift
//  ContactsApp
//
//  Created by Ngoc on 9/11/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var person = Person()
    
    var labelName = UILabel()
    
    var labelPhone = UILabel()
    
    var labelType = UILabel()
    
    var imvPhone = UIImageView()
    
    var imvMessage = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.labelName.frame = CGRectMake(30, 100, 300, 50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.fullName
        self.view.addSubview(self.labelName)
        
        self.labelType.frame = CGRectMake(30, 180, 200, 40)
        self.labelType.text = "mobile"
        self.labelType.textColor = UIColor.brownColor()
        self.view.addSubview(self.labelType)
        
        self.labelPhone.frame = CGRectMake(30, 200, 200, 40)
        self.labelPhone.text = person.phoneNumber
        self.view.addSubview(self.labelPhone)
        
        self.imvPhone.frame = CGRectMake(200, 200, 30, 30)
        self.imvPhone.image = UIImage(named: "phone.png")
        self.view.addSubview(self.imvPhone)
        
        self.imvMessage.frame = CGRectMake(240, 200, 30, 30)
        self.imvMessage.image = UIImage(named: "message.png")
        self.view.addSubview(self.imvMessage)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
