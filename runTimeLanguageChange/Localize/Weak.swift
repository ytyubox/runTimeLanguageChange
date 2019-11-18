//
//  Weak.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import Foundation

public
class Weak<Object: AnyObject> {
    weak var value: Object?
    init(_ v: Object) {
        self.value = v
    }
}

extension Weak: Hashable, Equatable where Object: Hashable {
    public static func == (lhs: Weak<Object>, rhs: Weak<Object>) -> Bool {
        return lhs.value == rhs.value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
	public static func == (lhs: Weak<Object>, rhs: Object) -> Bool {
		return lhs.value == rhs
	}
}

