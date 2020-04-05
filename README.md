# SimpleAPICall
<h2>Usage</h2>
<p>Make a REST API call using Swift.</p>

<h2>Swift</h2>

<pre>
<code>
// API Manager
    
    // API Manager
    
    func ApiManager() {
        
        // API url goes here
        let myUrl = "YOUR URL HERE"
        let dataURL = NSURL(string: myUrl)!
        
        // Prepares session
        let session = URLSession.shared
        
        // Calls url
        let task = session.dataTask(with: dataURL as URL) { (data, response, error) in
            
            // Checks for errors
            if let error = error {
                print(error)
            } else {
                
                // Checks for url response
                if let http = response as? HTTPURLResponse {
                    if http.statusCode == 200 {
                        
                        // Gets data
                        if let data = data {
                            
                            do {
                                // Parses Data
                                let userData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                
                                // Gets API data
                                if let dictionary = userData as? [NSObject: AnyObject] {
                                    
                                    // Sends Api data to another function where JSON objects are called
                                    self.jsonData(object: dictionary)
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
    
   </code>
   </pre>

<h2>Updates</h2>
<p>
    <i>
    *Code was updated to Swift 5.
    </i>
</p>
