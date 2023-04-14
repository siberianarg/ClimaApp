
import Foundation

struct WeatherManager {
    //https
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b5f291d42e6b66e28c8468268d19e83f&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //        1.create URL
        if let url = URL(string: urlString) {
            //        2.Create URLSession
            let session = URLSession(configuration: .default)
            //        3.give URLSession a task
            let task = session.dataTask(with: url) { data, responce, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            //        4.start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            
            
            print(weather.conditionId)

            
        } catch {
            print(error)
        }
        
    }
    
    
    
//    func getWeatherImage() -> String {
//        return weatherImage ?? ""
//    }
    
    
//    func getWeatherTemp() -> String {
//        return String(format: "%.0f", weatherTemp)
//    }
    
    
}
