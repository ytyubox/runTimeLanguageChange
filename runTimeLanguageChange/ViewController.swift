//
//  ViewController.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	private var language = Language.en {
		didSet {
			LocalizedManager.shared.change(setting: self.language.setting)
		}
	}
    @IBAction func didchangeSwitch(_ sender: UISwitch) {
		language.tonext()
    }
}

