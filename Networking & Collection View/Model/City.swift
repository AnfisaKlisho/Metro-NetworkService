//
//  City.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 02.12.2020.
//

import Foundation

struct City: Decodable{
    var id: String
    var name: String
    var lines: [Line]
}
