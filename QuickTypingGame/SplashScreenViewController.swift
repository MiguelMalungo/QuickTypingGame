import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showGameScreen", sender: self)
    }
    
    @IBAction func unwindToSplashScreen(_ unwindSegue: UIStoryboardSegue) {
       
    }

}
