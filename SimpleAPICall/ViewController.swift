//
//  ViewController.swift
//  SimpleAPICall
//
//  Created by Veronica Gutierrez on 12/28/16.
//  Copyright © 2016 Luz Gutierrez Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ---------------------------------

    // API Manager
    
    func ApiManager() {
        
        // API url goes here
        let myUrl = "YOUR URL HERE"
        let dataURL = NSURL(string: myUrl)!
        
        // Prepares session
        let session = NSURLSession.sharedSession()
        
        // Calls url
        let task = session.dataTaskWithURL(dataURL) { (data, response, error) in
            
            // Checks for errors
            if let error = error {
                print(error)
            } else {
                
                // Checks for url response
                if let http = response as? NSHTTPURLResponse {
                    if http.statusCode == 200 {
                        
                        // Gets data
                        if let data = data {
                            
                            do {
                                // Parses Data
                                let userData = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                                
                                // Gets API data
                                if let dictionary = userData as? [NSObject: AnyObject] {
                                    
                                    // Sends Api data to another function where JSON objects are called
                                    self.jsonData(dictionary)
                                }
                            }
                            catch let error as NSError {
                                print(error)
                            }
                        }
                    }
                }
            }
        }
        task.resume()
        
    }// end ApiManager
    
    // ---------------------------------
    
    // JSON Data Function
    
    func jsonData(object: [NSObject: AnyObject]) {
    
        // JSON Code Here
    
    } // end jsonData

} // end Class

