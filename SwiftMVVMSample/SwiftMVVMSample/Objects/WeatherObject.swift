//
//  Object.swift
//  SwiftMVVMSample
//
//  Created by Taillook on 2017/12/07.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class WeatherObject: Mappable {
    var mainItem: [Weather] = []
    
    init() {}
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        mainItem          <- map["weather"]
    }
}
