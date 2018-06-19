//
//  aLerViewController.swift
//  BooKeeper
//
//  Created by Guilherme Calado on 18/06/2018.
//  Copyright © 2018 Guilherme Calado. All rights reserved.
//

import UIKit
import CoreData

class aLerViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var arrayaLer = [Aler()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fetchRequest: NSFetchRequest<Aler> = Aler.fetchRequest()
        
        do {
            let aler = try PersistenceServce.context.fetch(fetchRequest)
            self.arrayaLer = aler
            self.tableView.reloadData()
        } catch {}
        
        
        
    }
    
    @IBAction func aLerAction(_ sender: UIBarButtonItem) { 
        
        let alert = UIAlertController(title: "Adicionar Livro", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Titulo"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Autor"
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Genero"
            
        }
        
        
 
        
        
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let nome = alert.textFields![0].text!
            let autor = alert.textFields![1].text!
            let genero = alert.textFields![2].text!
            let aler = Aler(context: PersistenceServce.context)
            aler.autor = autor
            aler.genero = genero
            aler.titulo = nome
            PersistenceServce.saveContext()
            self.arrayaLer.append(aler)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}



extension aLerViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayaLer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = arrayaLer[indexPath.row].titulo
        cell.detailTextLabel?.text = "Autor: " + arrayaLer[indexPath.row].autor! + "\n" + "Genero: " + arrayaLer[indexPath.row].genero!
        cell.detailTextLabel?.numberOfLines = 2
        
        return cell
    }
}

