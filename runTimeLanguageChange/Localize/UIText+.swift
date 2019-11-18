//
//  Localizable.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import UIKit

extension UILabel: Localizable {
	@IBInspectable var localizedKey: String? {
		get { self.accessibilityIdentifier }
		set {
			self.accessibilityIdentifier = newValue
			LocalizedManager.shared.apply(self)
		}
	}
}

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
}


extension UITextField:Localizable {
	@IBInspectable var localizedKey: String? {
		get { self.accessibilityIdentifier }
		set {
			self.accessibilityIdentifier = newValue
			LocalizedManager.shared.apply(self)
		}
	}
//	@IBInspectable var localizedKeyForPlaceholder:String? {
//		get { self.accessibilityIdentifier }
//		set {
//			self.accessibilityIdentifier = newValue
//			LocalizedManager.shared.apply(self)
//		}
//	}
}
