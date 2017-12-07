//
//  EventViewModel.swift
//  SwiftMVVMSample
//
//  Created by Taillook on 2017/12/07.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct ViewModel {
    let data = Variable<WeatherObject>(WeatherObject())
    let request = Requests()
    
    init() { }
    
    func getWeather(lat: String, lon: String) {
        request.getWeather(lat: lat, lon: lon) { (data: WeatherObject) in
            self.data.value = data
        }
    }
}
