//
//  LineHeaderView.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 05.12.2020.
//

import UIKit

class LineHeaderView: UICollectionReusableView {
    static let identifier = "LineHeader"
    
    @IBOutlet private weak var lineHeaderLabel: UILabel!
    
    func configure(with headerText: String?, color: String){
        lineHeaderLabel.text = headerText
        lineHeaderLabel.textColor = .fromHex(color)
    }
    
}
