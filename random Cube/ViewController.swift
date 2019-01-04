//
//  ViewController.swift
//  random Cube
//
//  Created by Kirill Verhoturov on 04/01/2019.
//  Copyright © 2019 Kirill Verhoturov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstCube: UIImageView! = {
        let cube = UIImageView()
        cube.translatesAutoresizingMaskIntoConstraints = false
        return cube
    }()
    
    let secondCube: UIImageView! = {
        let cube = UIImageView()
        cube.translatesAutoresizingMaskIntoConstraints = false
        return cube
    }()
    
    let totalLabel: UILabel! = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let roleButton: UIButton! = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitle("Бросить", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(randomCube), for: .touchUpInside)
        btn.layer.cornerRadius = 8
        btn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 13,bottom: 8,right: 13)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red:0.05, green:0.62, blue:0.90, alpha:1.0)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        

    }
    
    
    
    
    func setView() {
        
        view.addSubview(roleButton)
        view.addSubview(totalLabel)
        view.addSubview(firstCube)
        view.addSubview(secondCube)
        
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        let gradient = CAGradientLayer()
        gradient.colors = [colorTop, colorBottom]
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        
        roleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        roleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        totalLabel.bottomAnchor.constraint(equalTo: roleButton.topAnchor, constant: -30).isActive = true
        totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstCube.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        firstCube.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        firstCube.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstCube.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        secondCube.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        secondCube.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        secondCube.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondCube.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    @objc func randomCube(){
        let one = arc4random_uniform(6) + 1
        let two = arc4random_uniform(6) + 1
        totalLabel.text = "Результат: \(one + two)"
        firstCube.image = UIImage(named: "Dice\(one)")
        secondCube.image = UIImage(named: "Dice\(two)")
    }
    
    
    
    
    
}

