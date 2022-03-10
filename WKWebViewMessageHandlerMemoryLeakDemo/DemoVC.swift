import UIKit
import WebKit

class DemoScriptHandler: NSObject, WKScriptMessageHandler {
  func userContentController(_: WKUserContentController, didReceive message: WKScriptMessage) {
    print("DemoScriptHandler: \(message.body)")
  }
}

class DemoVC: UIViewController {
  private lazy var webView: WKWebView = {
    let webView = WKWebView()
    return webView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    webView.configuration.userContentController.add(DemoScriptHandler(), name: "DemoScriptHandler")

    view.addSubview(webView)
    webView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      webView.topAnchor.constraint(equalTo: view.topAnchor),
      webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }

  deinit {
    print("DemoVC deinit")

    // Without this, there would be memory leak:
    // webView.configuration.userContentController.removeAllUserScripts()

    // It will also leak `WKUserScript` if it is added
    
    // When the script in `WKUserScript` is very large, the leaked memory size is very significant.
  }
}
