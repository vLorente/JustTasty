//
//  Serie.swift
//  Practica iOS
//
//  Created by macOSSierra on 3/1/18.
//  Copyright © 2018 ucam. All rights reserved.
//

import UIKit

class Serie: NSObject {
    var nombre: String
    var descripcion: String
    
    init(nombre: String, descripcion: String) {
        self.nombre = nombre
        self.descripcion = descripcion
    }
}
