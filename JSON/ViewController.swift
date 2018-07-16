//
//  ViewController.swift
//  JSON
//
//  Created by Pedro Bertucci on 7/16/18.
//  Copyright © 2018 PEDRO. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data,response,error) in
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from:data!)
                
                for country in countries {
                    print(country.capital)
                }
                
            } catch {
                print("we got an error")
                
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

