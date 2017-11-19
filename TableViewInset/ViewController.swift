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
			setBehaviour(behaviour: .never)
		}
	}
	
	@available(iOS 11, *)
	func setBehaviour(behaviour: UIScrollViewContentInsetAdjustmentBehavior) {
		behaviourButton.title = getBehaviours()[behaviour]
		tableview.contentInsetAdjustmentBehavior = behaviour
	}
	
	@available(iOS 11, *)
	func getBehaviours() -> [ UIScrollViewContentInsetAdjustmentBehavior: String]{
		return [.never: "Never", .automatic: "Automatic", .always: "Always" , .scrollableAxes: "Axes" ]
	}

	@IBAction func toggle(_ sender: Any) {
		guard #available(iOS 11, *) else {
			return
		}
		
		let alert = UIAlertController(title: "Change behaviour", message: "", preferredStyle: .actionSheet)
		
		getBehaviours().forEach {  behaviour, title in
			alert.addAction(UIAlertAction(title: title, style: .default) { action in 
				self.setBehaviour(behaviour: behaviour)
			})
		}
		present(alert, animated: true, completion: nil)
	}
	
}

