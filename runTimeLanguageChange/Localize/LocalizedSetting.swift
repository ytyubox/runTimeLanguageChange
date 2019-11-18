//
//  LocalizedSetting.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import Foundation

protocol LikeLocalizedSetting {
    
}
enum Language:String {
	case en = "en"
	case ch = "zh-Hant"
	static func get(code:String)-> Language {
		Self.init(rawValue: code) ?? .en
	}
	fileprivate var fileName:String {
		switch self {
		case .en: return "en"
		case .ch: return "ch"
		}
	}
	var setting:LocalizedSetting {
		LocalizedSetting(language: self)
	}
	mutating func tonext() {
		switch self {
		case .ch: self = .en
		case .en: self = .ch
		}
	}
}

struct LocalizedSetting:LikeLocalizedSetting {
	static func getSettingFromLocale() {
		
	}
	init(language:Language) {
		self.fileName = language.fileName
	}
    let fileName:String
	private(set) lazy var cache:[String:String] = Self.getDic(fileName: self.fileName)
    private init(fileName:String) {
        self.fileName = fileName
    }
    private static func getDic(fileName:String) -> [String:String] {
        let s = BundleFile(fileName: fileName,fileType: "tsv").getfile()
        let lineList = s.split(separator: "\n")
        var result = [String:String](minimumCapacity: lineList.count)
        for line in lineList {
            let two = line.split(separator: "\t")
            let key = String(two[0])//.trimmingCharacters(in: characterSet)
            let value = String(two[1])//.trimmingCharacters(in: characterSet)
            result[key] = value
        }
        return result
    }
}
extension LocalizedSetting:CaseIterable {
	static var allCases: [LocalizedSetting] {
		[.en, .ch]
	}
	
	typealias AllCases = [Self]
	
	
}

extension LocalizedSetting {
    
    static var en: LocalizedSetting {
        LocalizedSetting(fileName: "en")
    }
    static var ch: LocalizedSetting {
        LocalizedSetting(fileName: "ch")
    }
}
