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
    
    private let spacing: CGFloat = 10
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        self.collectionView.reloadData()
        
    }

    private func loadData(){
        NetworkService.loadPosts { (lines, error) in
            if let error = error{
                self.showAlert(title: error.localizedDescription)
            }
            self.lines = lines
            self.collectionView.reloadData()
            
        }
    }
    
    
    private func showAlert(title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true, completion: nil)
    }

}

//MARK:-Extension
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return lines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return lines[section].stations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StationCell.identifier, for: indexPath) as? StationCell else{
            fatalError("Invalid cell kind")
        }
        
        let color: UIColor = .fromHex(lines[indexPath.section].hex_color)
        
        cell.layer.borderColor = color.cgColor
        cell.layer.borderWidth = 2
        cell.configure(with: lines[indexPath.section].stations[indexPath.row].name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LineHeaderView.identifier, for: indexPath) as? LineHeaderView else{
            fatalError("Invalid reusable view kind")
        }
        
        reusableView.configure(with: lines[indexPath.section].name, color: lines[indexPath.section].hex_color)
        
    
        return reusableView
    
    
}
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow: CGFloat = 2
        
        let width = view.bounds.width
        //let height = sec
        let summarySpacing = spacing * (numberOfItemsPerRow - 1)
        let insets = 2 * spacing
        let rawWidth = width - summarySpacing - insets
        
        let cellWidth = rawWidth / numberOfItemsPerRow
        
        return CGSize(width: cellWidth, height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

}
