//
//  ViewController.swift
//  TableViewInset
//
//  Created by Andrea on 20/11/17.
//  Copyright © 2017 Far North Fuels. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableview: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		if  #available(iOS 11, *) {
			tableview.contentInsetAdjustmentBehavior = .never
		}
		
		tableview.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
	}

	@IBAction func toggle(_ sender: Any) {
		guard #available(iOS 11, *) else {
			return
		}
		let actions:[String: UIScrollViewContentInsetAdjustmentBehavior] =
			["Never": .never, "Automatic": .automatic, "Always": .always, "Axes": .scrollableAxes]
		let alert = UIAlertController(title: "Change behaviour", message: "", preferredStyle: .actionSheet)
		
		actions.forEach { title, behaviour in
			alert.addAction(UIAlertAction(title: title, style: .default) { action in 
			self.tableview.contentInsetAdjustmentBehavior = behaviour
			})
		}
		present(alert, animated: true, completion: nil)
	}
	
}

