import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var textview1: UITextView!
    @IBOutlet weak var textview2: UITextView!
    @IBOutlet weak var key1: UITextField!
    @IBOutlet weak var key2: UITextField!
    @IBOutlet weak var key3: UITextField!
    @IBOutlet weak var textview3: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview3.layer.cornerRadius = 15
    }
    
    @IBAction func bt1_click(_ sender: UIButton) {
        let key_Value1 :Int = Int(key1.text!)!
        let key_Value2 :Int = Int(key2.text!)!
        let key_Value3 :Int = Int(key3.text!)!
        let key : Int = ((key_Value1 * key_Value3) - key_Value2)  % 13
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let day : Int = Int(dateFormatter.string(from: date)) ?? 1
        print(day)
        let encrypted_message : String = textfield1.text ?? "nill"
        var result : String = ""
        for character in encrypted_message{
            let asciivalue : Int = Int(character.asciiValue ?? 65)
            let new_char : String = String(UnicodeScalar(asciivalue-day+key) ?? "a")
            result = result + new_char
        }
        textview1.text = result
    }
    @IBAction func btn2_click(_ sender: UIButton) {
        let key_Value1 :Int = Int(key1.text!)!
        let key_Value2 :Int = Int(key2.text!)!
        let key_Value3 :Int = Int(key3.text!)!
        let key : Int = ((key_Value1 * key_Value3) - key_Value2)  % 13
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let day : Int = Int(dateFormatter.string(from: date)) ?? 1
        let encrypted_message : String = textfield2.text ?? "nill"
        var result : String = ""
        for character in encrypted_message{
            let asciivalue : Int = Int(character.asciiValue ?? 65)
            let new_char : String = String(UnicodeScalar(asciivalue+day-key) ?? "a")
            result = result + new_char
        }
        textview2.text = result
    }
}
