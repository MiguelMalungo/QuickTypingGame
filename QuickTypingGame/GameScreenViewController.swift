import UIKit

class GameScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let words = ["apple", "banana", "grape", "orange", "kiwi", "strawberry", "melon"]
    var currentWordIndex = 0
    var timer: Timer?
    var timeLeft = 5
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        startGame()
    }
    
    func startGame() {
        displayNextWord()
    }
    
    func displayNextWord() {
        resetTimer()
        wordLabel.text = words[currentWordIndex]
    }
    
    func resetTimer() {
        timer?.invalidate()
        timeLeft = 5
        timerLabel.text = "\(timeLeft)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft)"
        
        if timeLeft == 0 {
            timer?.invalidate()
            deductPoints()
            displayNextWord()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == words[currentWordIndex] {
            score += 10
        } else {
            score -= 5
        }
        scoreLabel.text = "\(score)"
        textField.text = ""
        currentWordIndex += 1
        
        if currentWordIndex >= words.count {
            endGame()
        } else {
            displayNextWord()
        }
        
        return true
    }
    
    func deductPoints() {
        score -= 5
        scoreLabel.text = "Score: \(score)"
    }
    
    func endGame() {
        timer?.invalidate()
        performSegue(withIdentifier: "showEndScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEndScreen",
           let endScreenViewController = segue.destination as? EndScreenViewController {
            endScreenViewController.finalScore = score
        }
    }
}

