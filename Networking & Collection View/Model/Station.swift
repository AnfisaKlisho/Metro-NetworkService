//
//  Station.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 02.12.2020.
//

import Foundation

struct Station: Decodable{
    var id: String
    var name: String
    var lat: Decimal
    var lng: Decimal
    var order: Int
    
}
