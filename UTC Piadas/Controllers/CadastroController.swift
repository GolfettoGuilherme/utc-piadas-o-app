//
//  CadastroController.swift
//  UTC Piadas
//
//  Created by Guilherme Golfetto on 26/04/21.
//

import UIKit
import Firebase

class CadastroController: UIViewController {
    
    @IBOutlet weak var txtPergunta: UITextField!
    @IBOutlet weak var txtResposta: UITextField!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add trocadilho"
        
        btnCadastrar.layer.cornerRadius = 5
        btnCadastrar.clipsToBounds = true
        
        
    }
    
    @IBAction func btnCadastrarClick(_ sender: UIButton) {
        if let pergunta = txtPergunta.text, let resposta = txtResposta.text {
            
            if !pergunta.isEmpty || !resposta.isEmpty{
                
                db.collection("piadas").addDocument(data: [
                    "pergunta":pergunta,
                    "resposta": resposta,
                    "date": Date().timeIntervalSince1970
                ])
                
                //salvar no Firebase como nova piada
                navigationController?.popToRootViewController(animated: true)
            }
            showAlert()
        } else{
            showAlert()
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Yo brother", message: "Vai vacilar assim? preenche as drogas dos campos e não enche o saco xarope", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok, foi mal", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
