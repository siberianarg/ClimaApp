
import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        

        
        
    }
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        print("city name (searchPressed): \(searchTextField.text!)")
        searchTextField.endEditing(true)
        
//        temperatureLabel.text = weatherManager.getWeatherTemp()
//        conditionImageView.image = UIImage(named: (weatherManager.getWeatherImage()))
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("city name (textFieldShouldReturn): \(searchTextField.text!)")
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        textField.text = ""
    }
}



