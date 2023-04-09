
import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchTextField.delegate.
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
    }
}

  
