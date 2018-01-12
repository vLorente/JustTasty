//
//  AnadirSerieViewController.swift
//  Practica iOS
//
//  Created by macOSSierra on 3/1/18.
//  Copyright © 2018 ucam. All rights reserved.
//

import UIKit

class AnadirSerieViewController: UITableViewController {

    @IBOutlet weak var btnGuardar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionGuardar(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alerta", message: "Funcionalidad aún no implementada. Disculpe las molestias.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
