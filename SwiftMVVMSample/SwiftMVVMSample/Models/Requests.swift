//
//  Requests.swift
//  SwiftMVVMSample
//
//  Created by Taillook on 2017/12/07.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import Alamofire
import ObjectMapper

class Requests {
    let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    let APIKey = "ade6ba106d7dad5e2178fc00335ba35b"
    
    func getWeather(lat: String, lon: String, callback: @escaping (WeatherObject) -> Void) {
        Alamofire.request(baseURL, method: .get, parameters: ["lat": lat, "lon": lon, "appid": APIKey])
            .responseJSON{ response in
                if response.response?.statusCode == 200 {
                    let data: WeatherObject = Mapper<WeatherObject>()
                        .map(JSONString: String(data: try! JSONSerialization.data(withJSONObject: response.result.value!, options: []), encoding: .utf8)!)!
                    callback(data)
                } else {
                    print(response.result.value!)
                }
        }
    }
}
