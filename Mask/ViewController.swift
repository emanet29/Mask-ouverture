//
//  ViewController.swift
//  Mask
//
//  Created by Snoopy on 21/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var bouton: UIButton!
    @IBOutlet weak var monBackground: UIImageView!
    
    var masque: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


    @IBAction func boutonAction(_ sender: Any) {
        if masque != nil {
            masque?.add(animer(), forKey: "bounds")
        } else {
            setup()
        }
    }
    
    func setup() {
        ajouterMasque()
        bouton.setTitle("Animer", for: .normal)
    }
    
    func ajouterMasque() {
        masque = CALayer()
        masque?.contents = #imageLiteral(resourceName: "codabee").cgImage
        masque?.bounds = CGRect(x: 0, y: 0, width: 300, height: 200)
        masque?.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        monBackground.layer.mask = masque
        view.backgroundColor = .black
        
    }
    
    func animer() -> CAKeyframeAnimation {
        let kfa = CAKeyframeAnimation(keyPath: "bounds")
        kfa.duration = 1
        kfa.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        if let taille = masque?.bounds {
            let largeur = taille.width
            let hauteur = taille.height
            
            // taille de depart
            let tailleDeDepart = taille
            
            // taille reduite
            let tailleReduite = CGRect(x: 0, y: 0, width: largeur * 0.8, height: hauteur * 0.8)
            
            // taille geante
            let tailleGeante = CGRect(x: 0, y: 0, width: 30000, height: 25000)
            
            kfa.values = [tailleDeDepart, tailleReduite, tailleGeante]
            
        }
        
        kfa.keyTimes = [0, 0.25, 1]
        kfa.isRemovedOnCompletion = false
        kfa.fillMode = kCAFillModeForwards
        kfa.delegate = self
        
        return kfa
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        masque?.removeFromSuperlayer()
        masque = nil
        bouton.setTitle("Remise a zero", for: .normal)
    }
    
}







