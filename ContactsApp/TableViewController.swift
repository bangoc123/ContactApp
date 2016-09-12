//
//  TableViewController.swift
//  ContactsApp
//
//  Created by Ngoc on 8/29/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayData: NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.tableView.sectionIndexBackgroundColor = UIColor.brownColor()
        
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        
        arrayData = NSMutableArray()
        
        for i in 0..<60{
            
            let person = Person()
            
            arrayData.addObject(person)
            
        }
        
        
        for element in arrayData{
            
            
            var person: Person!
            
            person = element as! Person
            
            var firstLetter: String! = (person.firstName as NSString).substringToIndex(1)
            
            var arrayForLetter: NSMutableArray!
            
            if(firstLetter == "Á"){
                firstLetter = "A"
            }
            
            if(firstLetter == "Đ"){
                firstLetter = "D"
            }
            
            if(dictContacts.valueForKey(firstLetter) != nil){

                    arrayForLetter = dictContacts.valueForKey(firstLetter) as! NSMutableArray
                    arrayForLetter.addObject(person)
                    dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }else{
                
                    arrayForLetter = NSMutableArray(objects: person)
                    dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
        }
        
        print(dictContacts)
        arrayKeys = dictContacts.allKeys
        
        func compareNames(s1:NSString, s2:NSString) -> Bool {
            return s1.capitalizedString < s2.capitalizedString
        }
        
        arrayKeys = arrayKeys.sortedArrayUsingComparator {
            (obj1, obj2) -> NSComparisonResult in
            
            let p1 = obj1 as! String
            let p2 = obj2 as! String
            let result = p1.compare(p2)
            return result
        }
        
        print(arrayKeys)
        
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return arrayKeys.count;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = arrayKeys[section]
        let sectionPersons = dictContacts.valueForKey(sectionTitle as! String)
        
        return (sectionPersons?.count)!
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKeys[section] as? String
    }
    
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")

        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        
        let sectionTitle: String = arrayKeys[indexPath.section] as! String
        let sectionPersons = dictContacts.valueForKey(sectionTitle)
        
        let person = sectionPersons![indexPath.row] as! Person
        
        cell?.textLabel?.text = person.fullName
        
        cell?.detailTextLabel?.text = person.phoneNumber
        
        return cell!
    }
    
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKeys as? [String]
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.brownColor()
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailVC = DetailVC()
        
        let sectionTitle = arrayKeys[indexPath.section]
    
        
        let sectionPerons = dictContacts[sectionTitle as! String]
        
        let person = sectionPerons![indexPath.row] as! Person
        
        detailVC.person = person
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
