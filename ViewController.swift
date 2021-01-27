//
//  ViewController.swift
//  KatesJsonParserApp
//
//  Created by KatesAndroid on 2021/1/27 PM 7:15
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "json", withExtension: "txt")
        
        do{
            
            let data = try Data(contentsOf: url!) // not nullable
            
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Array<Dictionary<String, AnyObject>> // cast from jsonObj to Dictionary, then to Array
        
            for t in jsonObj {
                print("Her name is \(t["name"] as! String)")
                print("she got \(t["height"] as! Int) cm in height")
                
                // let define and if
                if let w = t["weight"]{
                    print("and weight is between \(w["min"] as! Int)")
                    print("and \(w["max"] as? Int ?? 51) kg.")
                }
            }
            
            
            print ("--------------------")
            
        }catch{
            
            print(error.localizedDescription)
            
        }
        
        
    }


}

