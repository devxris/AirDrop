//
//  AirdropViewController.swift
//  AirDrop
//
//  Created by Chris Huang on 30/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class AirdropViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
	}

	// MARK: Model
	private let filenames = ["10 Great iPhone Tips.pdf", "camera-photo-tips.html", "foggy.jpg",
	                         "Hello World.ppt", "no more complaint.png", "Why Appcoda.doc"]
	
	private enum MIME: String { // Multipurpose Internet Mail Extensions "type/extension"
		case html = "text/html"
		case jpg =  "image/jpeg"
		case png =  "image/png"
		case doc =  "application/msword"
		case ppt =  "application/vnd.ms-powerpoint"
		case pdf =  "application/pdf"
		
		init?(type: String) {
			switch type.lowercased() {
			case "jpg":  self = .jpg
			case "png":  self = .png
			case "doc":  self = .doc
			case "ppt":  self = .ppt
			case "pdf":  self = .pdf
			case "html": self = .html
			default: return nil
			}
		}
	}
	
	// MARK: UITableViewDataSource and UITableViewDelegate
	override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filenames.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = filenames[indexPath.row]
		cell.imageView?.image = UIImage(named: "icon\(indexPath.row)")
		return cell
	}
}
