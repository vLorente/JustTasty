//
//  CatalogoTableViewController.swift
//  Practica iOS
//
//  Created by macOSSierra on 3/1/18.
//  Copyright © 2018 ucam. All rights reserved.
//

import UIKit
import FirebaseDatabase



class CatalogoTableViewController: UITableViewController {
    
    var catalogo = Catalogo()
    var ref: DatabaseReference!
    var seriesDB: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    @IBOutlet var tablaSeries: UITableView!
    @IBOutlet weak var btnActualizar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        seriesDB = ref.child("catalogo")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        databaseHandle = seriesDB.observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let serie = Serie(nombre: (value!["nombre"] as? String)!, descripcion: (value!["descripcion"] as? String)!)
            
            self.catalogo.series.append(serie)
            self.tableView.reloadData()
        
        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tablaSeries.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return catalogo.numCategorias()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        NSLog((String)(catalogo.numItems(categoria: section)))
        return catalogo.numItems(categoria: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaItem", for: indexPath)
        
        // Configure the cell...
        let serie = catalogo.getItem(indice: indexPath.row)
        cell.textLabel?.text = serie.nombre
        NSLog("Celda")
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetalleSegue"){
            let destino = segue.destination as! DetalleViewController
            destino.serie = catalogo.getItem(indice: (tableView.indexPathForSelectedRow?.row)!)
        }
        
    }
    
    @IBAction func actualizarTabla(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    

}

