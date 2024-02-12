//
//  addView.swift
//  Notas2
//
//  Created by Hazel Alain on 08/01/24.
//

import UIKit

class addView: UIViewController {


    @IBOutlet weak var fecha: UIDatePicker!
    @IBOutlet weak var nota: UITextView!
    @IBOutlet weak var titulo: UITextField!
    
    @IBOutlet weak var buton: UIButton!
    var notas : Notas? // Notas! con signo de admiracion estamos asegurando que hay datos y con simbolo de iterrogacion
                        //no estamos tan seguros
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = notas != nil ? "Editar nota" : "Crear nota"
        titulo.text = notas?.titulo
        nota.text = notas?.nota
        fecha.date = notas?.fecha ?? Date()
        
        if notas == nil {
            validarText()
            
        }else{
            buton.backgroundColor = .systemTeal
            validarTextLLeno()
            
            
        }

    }
    
    @IBAction func boton(_ sender: UIButton) {
        if notas != nil {
            Modelo.shared.editData(titulo: titulo.text ?? "", nota: nota.text, fecha: fecha.date, notas: notas!)
            navigationController?.popViewController(animated: true)
        }
        else {
            Modelo.shared.save(titulo: titulo.text ?? "", nota: nota.text, fecha: fecha.date)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    func validarText() {
        
        buton.isEnabled = false
        buton.backgroundColor = .systemGray2
        titulo.addTarget(self, action: #selector(validarTextFiel), for: .editingChanged)
    }
    
    func validarTextLLeno() {
        
        titulo.addTarget(self, action: #selector(validarTextFiel), for: .editingChanged)
    }
    
    
    @objc func validarTextFiel(sender: UITextField){
        guard let titulo2 = titulo.text, !titulo2.isEmpty else{
            buton.isEnabled = false
            buton.backgroundColor = .systemGray2
            
            return
        }
        
        buton.isEnabled = true
        buton.backgroundColor = .systemTeal
        
    }
    
   
   

}
