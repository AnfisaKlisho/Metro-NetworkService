//
//  ViewController.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {

    
    var cities = [City]()
    var stations = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }

    private func loadData(){
        NetworkService.loadPosts { (cities, error) in
            if let error = error{
                self.showAlert(title: error.localizedDescription)
            }
            self.cities = cities
            //self.tableView.reloadData()
        }
    }
    
    
    private func showAlert(title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true, completion: nil)
    }

}

