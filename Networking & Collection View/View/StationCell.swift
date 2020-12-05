//
//  StationCell.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 05.12.2020.
//

import UIKit

class StationCell: UICollectionViewCell {
    static let identifier = "StationCell"
    
    
    @IBOutlet private weak var stationLabel: UILabel!
    
    func configure(with labelText: String?){
        stationLabel.text = labelText
        
    }
}


