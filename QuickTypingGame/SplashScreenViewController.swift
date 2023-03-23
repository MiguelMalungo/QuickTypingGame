import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showGameScreen", sender: self)
    }
    
    @IBAction func unwindToSplashScreen(_ unwindSegue: UIStoryboardSegue) {
        // No additional code is needed here, as this function serves as an anchor for the unwind segue.
    }

}
