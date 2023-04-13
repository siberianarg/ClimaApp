
import Foundation

struct WeatherManager {
    //https
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b5f291d42e6b66e28c8468268d19e83f&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
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
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                }
            }
            
            //        4.start the task
            task.resume()
        }
    }
}
