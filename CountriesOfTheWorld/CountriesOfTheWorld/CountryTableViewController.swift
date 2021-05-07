//
//  ViewController.swift
//  CountriesOfTheWorld
//
//  Created by Ananya George on 5/7/21.
//

import UIKit
import Foundation

class CountryTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let nation = countries[indexPath.row]
        cell.textLabel?.text = nation
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        countryfunc()
        
        // Do any additional setup after loading the view.
    }
    
    var countries: [String] = []
    func countryfunc(){
        
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            let fflag = flag(country: code)
            countries.append(fflag + " " + name)
            
        }
        
    }
    
    func flag(country: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in country.utf16{
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
    
    
    
    
}




