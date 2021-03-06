//
//  Pantry.swift
//  VeggieBook
//
//  Created by Daniel DiPasquo on 6/19/17.
//  Copyright © 2017 DiPasquo Consulting. All rights reserved.
//  Copyright © 2020 Quick Help For Meals, LLC. All rights reserved.
//  Software developed at the University of Southern California.
//
//  This file is part of VeggieBook.
//
//  VeggieBook is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, version 3 of the license only.
//
//  VeggieBook is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or fitness for a particular purpose. See the
//  GNU General Public License for more details.
//

import Foundation

class Pantry {
    var name : String
    var id : Int
    
    init(fromJson:[String:Any]){
        name = fromJson["name"] as! String
        id = fromJson["id"] as! Int
    }
}
