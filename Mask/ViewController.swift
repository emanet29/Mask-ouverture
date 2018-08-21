//
//  ViewController.swift
//  Mask
//
//  Created by Snoopy on 21/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bouton: UIButton!
    @IBOutlet weak var monBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ajouterMasque()
    }


    @IBAction func boutonAction(_ sender: Any) {
        
    }
    
    func ajouterMasque(){
        let masque = CALayer()
        masque.contents = #imageLiteral(resourceName: "codabee").cgImage
        masque.bounds = CGRect(x: 0, y: 0, width: 300, height: 200)
        masque.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        monBackground.layer.mask = masque
        view.backgroundColor = .black
        
    }
    
}

