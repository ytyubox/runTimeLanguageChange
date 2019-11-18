#  Handle some Text in UIKit for different language

![](demo.gif)

## Ability

1. Handle  `.tsv` file which value in pair, in single line.
2. Assign key in Interface builder, like `.storyboard`, `.xib` file.
3. Change all UI object text by only  `LocalizedManager.shared.change(setting:)`

## Usage:

1. Add `_Language_.tsv` into Bundle
```tsv
hi	hello
bye	bye bye
```
2. Add case in `enum Language`, make sure system code is related.
```swift 
enum Language {
	case en = "_SYSTEM_LANGUAGE_CODE_"
	case ch = "zh-Hant"
}
```
3. Give the file name to the `Language` case
```swift
extension Language {
	var fileName:String {
		switch self {
			case .en: return "en"
			case .ch: return "ch"
		}
	}
}
```
4. Give `localizedKey` in Interface builder for each UILabel, UIButton, UITextfield
```
<userDefinedRuntimeAttributes>
	<userDefinedRuntimeAttribute type="string" keyPath="localizedKey" value="hi"/>
</userDefinedRuntimeAttributes>
```
5. Change `LocalizedManager.shared.change(setting:)` in proper way
```swift
	LocalizedManager.shared.change(setting: self.language.setting)
```

## todo:

- [ ] To SPM
