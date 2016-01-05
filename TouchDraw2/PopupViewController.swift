import UIKit

class PopupViewController: UIViewController {
    
//    var choiceArray: [String] = []
    
    // add a closure property to be called
    
//    var madeChoice: ((choice: String) -> ())?
    
//    @IBOutlet weak var picker: UIPickerView!
    
  override var preferredContentSize: CGSize {
    get {
      return CGSize(width: 300, height: 275)
    }
    set {
      super.preferredContentSize = newValue
    }
  }

    
//    @IBAction func okButtonTapped(sender: Buttons) {
//    
//        // call the closure property
//        
//        let row = picker.selectedRowInComponent(0)
//        madeChoice?(choice: choiceArray[row])
//
//        dismissViewControllerAnimated(true, completion: nil)
//    
//    }
    
    
}