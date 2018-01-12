//
//  Catalogo.swift
//  Practica iOS
//
//  Created by macOSSierra on 3/1/18.
//  Copyright © 2018 ucam. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Catalogo: NSObject {
    
    var series = [Serie]()
    var ref: DatabaseReference!
    var seriesDB: DatabaseReference!
    
    func numCategorias() -> Int{
        return 1
    }
    
    func numItems(categoria: Int) -> Int{
        return series.count
    }
    
    func cargaModelo(){
        ref = Database.database().reference()
        seriesDB = ref.child("catalogo")
       
        seriesDB.observe(.childAdded, with: { (snapshot) -> Void in
            let value = snapshot.value as? NSDictionary
            let nombreRecibido = value?["nombre"] as? String
            let descripcionRecibido = value?["descripcion"] as? String
            let nuevaSerie = Serie(nombre: nombreRecibido!, descripcion: descripcionRecibido!)
            self.series.append(nuevaSerie)
            NSLog(nuevaSerie.nombre);
        })
    }
    
    
    
    func getItem(indice: Int) -> Serie {
        return series[indice]
    }
}
