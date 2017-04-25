//
//  ViewController.swift
//  iWeather
//
//  Created by Nguyen Quynh Chi on 4/24/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbCity: UILabel!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var imBackgound: UIImageView!
    @IBOutlet weak var lbKindOfDegree: UILabel!
    @IBOutlet weak var btTemp: UIButton!
    
    var quotes = ["Since we cannot change reality, let us change the eyes which see reality.",
                  "Without a struggle, there can be no progress.",
                  "If you don't like something, change it. If you can't change it, change your attitude."]
    
    var cities = ["Courtneyfurt", "South Wilford", "East Rosendo"]
    
    var backgroundImage = ["Blood", "Moon", "Sun"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btRandom(_ sender: UIButton) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(cities.count)))
        lbCity.text = cities[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbQuote.text = quotes[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        imBackgound.image = UIImage.init(named: backgroundImage[imageIndex])
        
        getTemp()
    }
    
    @IBAction func btChangeDegree(_ sender: UIButton) {
        var kindOfDegree = lbKindOfDegree.text
        var temperature = Double(btTemp.currentTitle!)
        
        if kindOfDegree == "C" {
            temperature = temperature!*9/5 + 32
            kindOfDegree = "F"
        } else if kindOfDegree == "F" {
            temperature = (temperature! - 32)*5/9
            kindOfDegree = "C"
        }
        
        let result = String(format: "%2.1f", temperature!)
        btTemp.setTitle(String(result), for: .normal)
        lbKindOfDegree.text = kindOfDegree
    }
    
    
    func getTemp() -> Void {
        var random: Double
        let kindOfDegree = lbKindOfDegree.text
        
        if kindOfDegree == "C" {
            random = randomTemp()
        } else {
            random = randomTemp()*9/5 + 32
        }
        
        let randomNumber = String(format: "%2.1f", random)
        
        btTemp.setTitle(randomNumber, for: .normal)
    }
    
    func randomTemp() -> Double {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random())/Double(INT32_MAX)
    }

}

