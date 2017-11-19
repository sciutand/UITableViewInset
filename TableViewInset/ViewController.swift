//
//  ViewController.swift
//  TableViewInset
//
//  Created by Andrea on 20/11/17.
//  Copyright © 2017 Far North Fuels. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var behaviourButton: UIBarButtonItem!
	@IBOutlet weak var tableview: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		tableview.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
		if  #available(iOS 11, *) {
			setBehaviour(behaviour: .never, title: "Never")
		}
	}
	
	@available(iOS 11, *)
	func setBehaviour(behaviour: UIScrollViewContentInsetAdjustmentBehavior, title: String) {
		behaviourButton.title = title
		tableview.contentInsetAdjustmentBehavior = behaviour
	}
	
	@available(iOS 11, *)
	func getBehaviours() -> [String: UIScrollViewContentInsetAdjustmentBehavior]{
		return ["Never": .never, "Automatic": .automatic, "Always": .always, "Axes": .scrollableAxes]
	}

	@IBAction func toggle(_ sender: Any) {
		guard #available(iOS 11, *) else {
			return
		}
		
			
		let alert = UIAlertController(title: "Change behaviour", message: "", preferredStyle: .actionSheet)
		
		getBehaviours().forEach { title, behaviour in
			alert.addAction(UIAlertAction(title: title, style: .default) { action in 
				self.setBehaviour(behaviour: behaviour, title: title)
			})
		}
		present(alert, animated: true, completion: nil)
	}
	
}

