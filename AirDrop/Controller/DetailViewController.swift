//
//  DetailViewController.swift
//  AirDrop
//
//  Created by Chris Huang on 30/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	
	var filename = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Get the full path of the file
		guard let fileURL = fileToURL(file: filename) else { return }
		let urlRequest = URLRequest(url: fileURL)
		webView.load(urlRequest)
	}
	
	func fileToURL(file: String) -> URL? {
		// Get the full path of the file
		let fileComponents = file.components(separatedBy: ".")
		guard let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) else { return nil }
		return URL(fileURLWithPath: filePath)
	}
}
