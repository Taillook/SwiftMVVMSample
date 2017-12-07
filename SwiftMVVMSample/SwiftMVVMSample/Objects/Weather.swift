//
//  MainWeather.swift
//  SwiftMVVMSample
//
//  Created by Taillook on 2017/12/07.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class MainWeather: Mappable {
    var main: MainWeather?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        main            <- map["main"]
    }
}

