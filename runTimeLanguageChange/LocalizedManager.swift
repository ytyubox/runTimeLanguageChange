//
//  LocalizedManager.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import Foundation
import UIKit.UILabel
import UIKit.UITextField
import UIKit.UIButton

protocol Localizable: AnyObject {
	var localizedKey:String? {get set}
}

class LocalizedManager {
	static var shared = LocalizedManager()
	private(set) var setting: LocalizedSetting = .en
	func change(setting newsetting: LocalizedSetting) {
		print("changing", setting.fileName)
		self.setting = newsetting
		bSet.forEach{
			guard let v = $0.value else {return}
			UIView.performWithoutAnimation {
				v.setTitle(setting.cache[(v.accessibilityIdentifier!)], for: .normal)
				v.layoutIfNeeded()
			}
		}
		fSet.forEach{
			guard let v = $0.value else {return}
			v.placeholder = setting.cache[(v.accessibilityIdentifier!)]
		}
		lSet.forEach { l in
			guard let v = l.value else {return}
			v.text = setting.cache[v.accessibilityIdentifier!]
		}
	}
	
	
	private var bSet = Set<Weak<UIButton>>()
	private var fSet = Set<Weak<UITextField>>()
	private var lSet = Set<Weak<UILabel>>()
	private func add(_ button:UIButton)         { bSet.insert(Weak(button)) }
	private func add(_ label:UILabel)           { lSet.insert(Weak(label)) }
	private func add(_ textField:UITextField)   { fSet.insert(Weak(textField)) }
	
	func apply(_ label: UILabel) {
		
		label.text = setting.cache[label.accessibilityIdentifier!]
		add(label)
	}
	func apply(_ button: UIButton, state:UIButton.State) {
		
		button.setTitle( setting.cache[button.accessibilityIdentifier!], for: state)
		add(button)
	}
	func apply(_ textField: UITextField) {
		
		textField.placeholder = setting.cache[textField.accessibilityIdentifier!]
		add(textField)
	}
}

extension Weak where Object == UILabel {
	func update() {
		value?.localizedKey = value?.accessibilityIdentifier
	}
}
//
extension Weak where Object == UIButton {
	func update() {
		
		value?.localizedKey = value?.accessibilityIdentifier
		value?.sizeToFit()
		
	}
}
extension Weak where Object == UITextField {
	func update() {
		value?.localizedKey = value?.accessibilityIdentifier
		value?.localizedKeyForPlaceholder = value?.accessibilityIdentifier
	}
}
