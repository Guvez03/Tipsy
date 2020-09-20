//
//  ViewController.swift
//  Tips
//
//  Created by ahmet on 20.09.2020.
//  Copyright © 2020 ahmetguvez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalBillLabel: UITextField!
    @IBOutlet weak var splitCountLabel: UILabel!
    @IBOutlet weak var zeroButtonOutlet: UIButton!
    @IBOutlet weak var tenButtonOutlet: UIButton!
    @IBOutlet weak var twentyButtonOutlet: UIButton!
    
    var tipsOp : Double?
    var splitOp : Float?
    var totalOp : Float?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipsButton(_ sender: UIButton) {
        
        if let tips = sender.currentTitle {
            
            zeroButtonOutlet.isSelected = false
            tenButtonOutlet.isSelected = false
            twentyButtonOutlet.isSelected = false
            
            if tips == "0%" {
                tipsOp = 0.0
                zeroButtonOutlet.isSelected = true
            }
            else if tips == "10%"{
                tipsOp = 0.1
                tenButtonOutlet.isSelected = true

            }
            else if tips == "20%"{
                tipsOp = 0.2
                twentyButtonOutlet.isSelected = true

            }
            
        }
    }
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        splitCountLabel.text = String(format:"%0.0f", sender.value)        
        splitOp = Float(sender.value)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        if  let totalBill = totalBillLabel.text {
            if let convertInt = Float(totalBill){
                if let total = tipsOp {
                    let toplam : Float = (convertInt + ( convertInt * Float(tipsOp!)) ) / splitOp!

                    performSegue(withIdentifier: "goToResult", sender: toplam)
                    
                }
            }
            
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let pricePerPerson = sender as! Float
        
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultController
            
            destinationVC.result = pricePerPerson
            destinationVC.tips = tipsOp
            destinationVC.split = splitOp
            
        }
        
        
    }
    
    
    
    
}

