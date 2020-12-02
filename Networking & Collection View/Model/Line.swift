//
//  Line.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 02.12.2020.
//

import Foundation

struct Line: Decodable{
    var id: String
    var hex_color: String
    var name: String
    var stations: [Station]
}
