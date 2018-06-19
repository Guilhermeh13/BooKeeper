//
//  FavoritosViewController.swift
//  BooKeeper
//
//  Created by Guilherme Calado on 18/06/2018.
//  Copyright © 2018 Guilherme Calado. All rights reserved.
//

import UIKit
import CoreData

class FavoritosViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayFavoritos = [Favoritos()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fetchRequest: NSFetchRequest<Favoritos> = Favoritos.fetchRequest()
        
        do {
            let fav = try PersistenceServce.context.fetch(fetchRequest)
            self.arrayFavoritos = fav
            self.tableView.reloadData()
        } catch {}
        
        
        
    }
    
    @IBAction func favAction(_ sender: UIBarButtonItem) {   
        
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
        
        
        
        
        
        let action = UIAlertAction(title: "Adicionar", style: .default) { (_) in
            let nome = alert.textFields![0].text!
            let autor = alert.textFields![1].text!
            let genero = alert.textFields![2].text!
            let fav = Favoritos(context: PersistenceServce.context)
            fav.autor = autor
            fav.genero = genero
            fav.titulo = nome
            PersistenceServce.saveContext()
            self.arrayFavoritos.append(fav)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}



extension FavoritosViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = arrayFavoritos[indexPath.row].titulo
        cell.detailTextLabel?.text = "Autor: " + arrayFavoritos[indexPath.row].autor! + "\n" + "Genero: " + arrayFavoritos[indexPath.row].genero!
        cell.detailTextLabel?.numberOfLines = 2
        
        return cell
    }
}
