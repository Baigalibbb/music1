//
//  ViewController.swift
//  musicsearch
//
//  Created by Tenizbayev Bolat on 26.01.2024.
//

import UIKit
import WebKit
import SVProgressHUD

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webview: WKWebView!
    
    var music = Itunes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        
        let url = URL(string: music.previewUrl)
        let urlrequest = URLRequest(url: url!)
        webview.load(urlrequest)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        SVProgressHUD.dismiss()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        SVProgressHUD.dismiss()
    }


}

