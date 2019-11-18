//
//  BundleFile.swift
//  runTimeLanguageChange
//
//  Created by 游宗諭 on 2019/11/18.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import Foundation

struct BundleFile {
    var path:URL! {Bundle.main.url(forResource:fileName, withExtension: fileType)}
    let fileName:String
	let fileType:String
     func getfile()->String {
        return try! String(contentsOf: path)
    }
}
