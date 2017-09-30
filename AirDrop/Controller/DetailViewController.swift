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
		
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
		
		// Get the full path of the file
		guard let fileURL = fileToURL(file: filename) else { return }
		let urlRequest = URLRequest(url: fileURL)
		webView.load(urlRequest)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .automatic
	}
	
	private func fileToURL(file: String) -> URL? {
		// Get the full path of the file
		let fileComponents = file.components(separatedBy: ".")
		let file: (name: String, ext: String) = (fileComponents[0], fileComponents[1])
		guard let filePath = Bundle.main.path(forResource: file.name, ofType: file.ext) else { return nil }
		return URL(fileURLWithPath: filePath)
	}
	
	@IBAction func share(_ sender: UIBarButtonItem) {
	}
}
