//
//  LidoViewController.swift
//  BooKeeper
//
//  Created by Guilherme Calado on 18/06/2018.
//  Copyright © 2018 Guilherme Calado. All rights reserved.
//

import UIKit
import CoreData


class LidoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayLido = [Lido]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fetchRequest: NSFetchRequest<Lido> = Lido.fetchRequest()
        
        do {
            let lido1 = try PersistenceServce.context.fetch(fetchRequest)
            self.arrayLido = lido1
            self.tableView.reloadData()
        } catch {}
        

        
    }
    
    
    @IBAction func lidoAction(_ sender: UIBarButtonItem) {
        
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
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "Classificação"
            
        }
        
        
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let nome = alert.textFields![0].text!
            let autor = alert.textFields![1].text!
            let genero = alert.textFields![2].text!
            let classificacao = alert.textFields![3].text!
            let lido = Lido(context: PersistenceServce.context)
            lido.autor = autor
            lido.classificacao = classificacao
            lido.genero = genero
            lido.titulo = nome
            PersistenceServce.saveContext()
            self.arrayLido.append(lido)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    
    }
        
        
        
        
        
    }
    
    



extension LidoViewController: UITableViewDataSource {
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLido.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = arrayLido[indexPath.row].titulo
        cell.detailTextLabel?.text = "Autor: " + arrayLido[indexPath.row].autor! + "\n" + "Genero: " + arrayLido[indexPath.row].genero! + "\n" + "Classificação: " + arrayLido[indexPath.row].classificacao!
        cell.detailTextLabel?.numberOfLines = 3
        
        
        
        return cell
    }
}
