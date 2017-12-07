//
//  MainWeather.swift
//  SwiftMVVMSample
//
//  Created by Taillook on 2017/12/07.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class Weather: Mappable {
    var description = ""
    var icon = ""
    var main = ""
    
    init() {}
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        description <- map["description"]
        icon        <- map["icon"]
        main        <- map["main"]
    }
}

