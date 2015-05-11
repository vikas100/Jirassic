//
//  JLWriteLog.swift
//  Jira-Logger
//
//  Created by Baluta Cristian on 28/03/15.
//  Copyright (c) 2015 Cristian Baluta. All rights reserved.
//

import Foundation

class JLTaskWriter: NSObject {

	override init() {
		
	}
	
	func write(task: Task) {
		task.saveEventually { (success, error) -> Void in
			println("saved task to Parse \(success) \(error)")
		}
	}
}