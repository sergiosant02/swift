//
//  WeatherModel.swift
//  Clima
//
//  Created by Sergio Santiago on 5/3/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let id: Int
    let decription: String
    let temperature: Float
    let name: String
    
    var temeperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionId: String{
        switch (id){
        case 200..<300:
            return "cloud.bolt.rain"
        case 300..<322:
            return "cloud.drizzle"
        case 500..<532:
            return "cloud.rain"
        case 600..<632:
            return "snow"
        case 700..<800:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
    }
}
