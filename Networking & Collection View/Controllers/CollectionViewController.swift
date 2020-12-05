//
//  CollectionViewController.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 05.12.2020.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var lines = [Line]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func loadData(){
        NetworkService.loadPosts { (lines, error) in
            if let error = error{
                self.showAlert(title: error.localizedDescription)
            }
            self.lines = lines
            //self.tableView.reloadData()
        }
    }
    
    
    private func showAlert(title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true, completion: nil)
    }

}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return lines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StationCell.identifier, for: indexPath) as? StationCell else{
            fatalError("Invalid cell kind")
        }
        
        cell.configure(with: lines[indexPath.section].stations[indexPath.row].name)
        
        return cell
    }
}
