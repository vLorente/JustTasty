//
//  DetalleViewController.swift
//  Practica iOS
//
//  Created by macOSSierra on 3/1/18.
//  Copyright © 2018 ucam. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    var serie = Serie (nombre: "", descripcion: "")

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var textDescripcion: UITextView!
    @IBOutlet weak var puntuacion: PuntuacionEstrellas!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitulo.text = serie.nombre
        self.textDescripcion.text = serie.descripcion
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
