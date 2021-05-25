//
//  DisputaController.swift
//  UTC Piadas
//
//  Created by Guilherme Golfetto on 26/04/21.
//

import UIKit
import Firebase

class DisputaController: UIViewController {
    
    
    @IBOutlet weak var txtPergunta: UILabel!
    @IBOutlet weak var btnRevelar: UIButton!
    @IBOutlet weak var txtResposta: UILabel!
    @IBOutlet weak var btnProximo: UIButton!
    
    let db = Firestore.firestore()
    
    var piadas: [Piada] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Disputa"
        
        btnRevelar.layer.cornerRadius = 5
        btnRevelar.clipsToBounds = true
        
        btnProximo.layer.cornerRadius = 5
        btnProximo.clipsToBounds = true
        
        carregarTrocadilho()
    
    }
    
    
    func carregarTrocadilho(){
        
        db.collection("piadas")
            .addSnapshotListener { (querySnapshot, error) in
                
                if let e = error {
                    print("Deu ruim ao carregar os trocadilhos ta? \(e)")
                } else{
                    self.piadas = []
                    if let snapshotDocuments = querySnapshot?.documents {
                        
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            
                            if let pergunta = data["pergunta"] as? String, let resposta = data["resposta"] as? String {
                                let piada = Piada(Pergunta: pergunta, Resposta: resposta)
                                self.piadas.append(piada)
                            }
                            
                        }
                        
                    }
                }
                
                DispatchQueue.main.async {
                    self.mostrarProximaPiada()
                }
                
            }

    }
    
    @IBAction func btnRelevarClick(_ sender: UIButton) {
        self.txtResposta.isHidden = false
    }
    
    @IBAction func btnProximoClick(_ sender: UIButton) {
        mostrarProximaPiada()
    }
    
    func mostrarProximaPiada() {
        if let piadaDaVez = self.piadas.randomElement() {
            self.txtPergunta.text = piadaDaVez.Pergunta
            self.txtResposta.text = piadaDaVez.Resposta
            self.txtResposta.isHidden = true
        }
    }
    
}
