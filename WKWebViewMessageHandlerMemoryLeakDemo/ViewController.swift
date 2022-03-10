// 

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func showDemoWebViewVC(_ sender: Any) {
    let demoVC = DemoVC(nibName: nil, bundle: nil)
    
    present(demoVC, animated: true, completion: nil)
  }
  
}

