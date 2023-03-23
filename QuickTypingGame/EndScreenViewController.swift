import UIKit

class EndScreenViewController: UIViewController {
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "Final Score: \(finalScore)"
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToSplashScreen", sender: self)
    }
}
