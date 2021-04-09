//
//  WeatherManager.swift
//  Clima
//
//  Created by Sergio Santiago on 11/2/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


protocol updateWeatherDelegate{
    func didUpdateWeather(weatherManager: WeatherManager ,weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager{
    
    var delegate: updateWeatherDelegate?
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=18f91d78d76100828ebfe91c50692c8e&units=metric&lang=sp"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fechWeather(latitude: Double, longitude: Double){
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: {data,response,error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJson(safeData){
                        self.delegate?.didUpdateWeather(weatherManager: self, weather: weather)
                        
                    }
                }
            })
            task.resume()
        }
        
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.weather[0].description)
            let id = decodeData.weather[0].id
            let temperature = decodeData.main.temp
            let name = decodeData.name
            let description = decodeData.weather[0].description
            let weather = WeatherModel(id: id, decription: description, temperature: temperature, name: name)
            print(weather.conditionId)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    
    
}

