//
//  LineHeaderView.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 05.12.2020.
//

import UIKit

class LineHeaderView: UICollectionReusableView {
    static let identifier = "LineHeader"
    
    @IBOutlet weak var lineHeaderLabel: UILabel!
    
    func configure(with headerText: String?){
        lineHeaderLabel.text = headerText
    }
    
}
