//
//  ResultController.swift
//  Tips
//
//  Created by ahmet on 20.09.2020.
//  Copyright © 2020 ahmetguvez. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var totalResult: UILabel!
    @IBOutlet weak var explanation: UILabel!
    
    var result : Float?
    var tips : Double?
    var split : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalResult.text = String(format: "%0.2f", result!)
        let tipsConver = tips! * 100
        print(tipsConver)
        let splitConvert = Int(split!)
        explanation.text = "\(splitConvert) kişiye bölünmüş, %\(tipsConver) tip ile."
    }
    
    @IBAction func tryCalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
