//
//  Localizable.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import UIKit

extension String {
	var localized:String { NSLocalizedString(self, comment: "")}
}

protocol TextPresentable {
	var firstText:String? {get set}
	var secondText:String? {get set}
}


extension UILabel: Localizable {
	@IBInspectable var localizedKey: String? {
		get { self.accessibilityIdentifier }
		set {
			self.accessibilityIdentifier = newValue
			LocalizedManager.shared.apply(self)
		}
	}
}

extension UILabel: TextPresentable {
	var firstText: String? {
		get {text }
		set {text = newValue }
	}
	
	var secondText: String? {
		get { nil }
		set { print("Label have no second text") }
	}
	
	
}
//
extension UIButton:Localizable {
	@IBInspectable var localizedKey: String? {
		get { self.accessibilityIdentifier }
		set {
			UIView.performWithoutAnimation {
				self.accessibilityIdentifier = newValue
				LocalizedManager.shared.apply(self, state: .normal)
				self.layoutIfNeeded()
			}
		}
	}
	@IBInspectable var localKeyForSelected: String? {
		get { self.accessibilityIdentifier }
		set {
			UIView.performWithoutAnimation {
				self.accessibilityIdentifier = newValue
				LocalizedManager.shared.apply(self, state: .selected)
				self.layoutIfNeeded()
			}
		}
	}
}


extension UITextField:Localizable {
	@IBInspectable var localizedKey: String? {
		get { self.accessibilityIdentifier }
		set {
			self.accessibilityIdentifier = newValue
			LocalizedManager.shared.apply(self)
		}
	}
	@IBInspectable var localizedKeyForPlaceholder:String? {
		get { self.accessibilityIdentifier }
		set {
			self.accessibilityIdentifier = newValue
			LocalizedManager.shared.apply(self)
		}
	}
}
