import UIKit
import WebKit

class DetailViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{
    
    var selectedDetailViewObject: DiveDetail?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myURL = URL(string: (selectedDetailViewObject?.url)!){
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
        
        
}

