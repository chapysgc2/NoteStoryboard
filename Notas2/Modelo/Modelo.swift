//
//  Modelo.swift
//  Notas2
//
//  Created by Hazel Alain on 08/01/24.
//

import Foundation
import CoreData
import UIKit

class Modelo {
    //conexion con la base de datos
    public static let shared = Modelo()
    func contexto() -> NSManagedObjectContext {

        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
        
    }
    func save(titulo: String, nota: String, fecha: Date){
        
        let context = contexto()
        let entityNotas = NSEntityDescription.insertNewObject(forEntityName: "Notas", into: context) as! Notas
        entityNotas.titulo = titulo
        entityNotas.nota = nota
        entityNotas.fecha = fecha
        
        do{
            
            try context.save()
            print("Camara se guardo!")
            
            
        } catch let error as NSError {
            print("Error no guardo!", error.localizedDescription)
        }
    }
    
    
    func editData(titulo: String, nota: String, fecha: Date, notas : Notas){
        
        let context = contexto()
        notas.setValue(titulo, forKey: "titulo")
        notas.setValue(nota, forKey: "nota")
        notas.setValue(fecha, forKey: "fecha")
        do{
            
            try context.save()
            print("edito!")
            
            
        } catch let error as NSError {
            print("Error al editar!", error.localizedDescription)
        }
    }
}
