//
//  LeitorViewController.swift
//  BooKeeper
//
//  Created by Guilherme Calado on 18/06/2018.
//  Copyright © 2018 Guilherme Calado. All rights reserved.
//

import UIKit

class LeitorViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dtNascimentoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func inserirButton(_ sender: UIButton) {
      
        
        if nameLabel.text! == "" && dtNascimentoLabel.text! == "" &&
            emailLabel.text! == ""{
            
            let alert = UIAlertController(title: "Inserir Dados", message: nil, preferredStyle: .alert)
            alert.addTextField { (tf) in tf.placeholder = "Nome" }
            alert.addTextField { (tf) in tf.placeholder = "Data de Nascimento" }
            alert.addTextField { (tf) in tf.placeholder = "Email" }
            
            let action = UIAlertAction(title: "Gravar", style: .default) { (_) in
                let name =  alert.textFields?[0].text
                let email = alert.textFields?[1].text
                let data = alert.textFields?[2].text
                self.nameLabel.text! = name!
                self.emailLabel.text! = email!
                self.dtNascimentoLabel.text! = data!
                
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "", message: "Há campos já preenchidos!", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                
                
            }
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
            
            
            
            
        }
        
        
    }
        
    @IBAction func updateButton(_ sender: UIButton) {
        
        if nameLabel.text! != "" && dtNascimentoLabel.text! != "" &&
            emailLabel.text! != ""{
            
            let alert = UIAlertController(title: "Atualizar dados", message: nil, preferredStyle: .alert)
            alert.addTextField { (tf) in tf.placeholder = "Nome" }
            alert.addTextField { (tf) in tf.placeholder = "Data de Nascimento" }
            alert.addTextField { (tf) in tf.placeholder = "Email" }
            
            let action = UIAlertAction(title: "Gravar", style: .default) { (_) in
                let name =  alert.textFields?[0].text
                let email = alert.textFields?[1].text
                let data = alert.textFields?[2].text
                self.nameLabel.text! = name!
                self.emailLabel.text! = email!
                self.dtNascimentoLabel.text! = data!
                
                
                
                
            }
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
            
            
            
        }else{
            let alert = UIAlertController(title: "", message: "Campos estão vazios!", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                
                
            }
            
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
            
            
            
        }
        
        
        
        
        
    }
    
        
    @IBAction func cleanButton(_ sender: UIButton) {
      
        self.nameLabel.text! = ""
        self.emailLabel.text! = ""
        self.dtNascimentoLabel.text! = ""
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
        
        
    }
    
    
    
    
    
    
    
    
    

