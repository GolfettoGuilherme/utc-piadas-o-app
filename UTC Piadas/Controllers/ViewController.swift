//
//  ViewController.swift
//  UTC Piadas
//
//  Created by Guilherme Golfetto on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnCadastro: UIButton!
    @IBOutlet weak var btnDisputa: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UTC"
        
        btnCadastro.layer.cornerRadius = 15.0
        btnCadastro.layer.borderWidth = 2.0
        btnCadastro.clipsToBounds = true
        
        btnDisputa.layer.cornerRadius = 15.0
        btnDisputa.layer.borderWidth = 2.0
        btnDisputa.clipsToBounds = true
    }


}

