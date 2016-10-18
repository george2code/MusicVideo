//
//  ViewController.swift
//  MusicVideo
//
//  Created by Yuri on 10/18/16.
//  Copyright © 2016 fusta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Call Api
        let api = APIManager()
        api.loadData(urlString: "https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",
                     completion: didLoadData)
        
        
    }
    
    func didLoadData(result:String) {
        
        let alertController = UIAlertController(title: result, message: nil, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }


}
