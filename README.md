# TextFieldWrapper

[![CI Status](http://img.shields.io/travis/s1Moinuddin/TextFieldWrapper.svg?style=flat)](https://travis-ci.org/s1Moinuddin/TextFieldWrapper)
[![Version](https://img.shields.io/cocoapods/v/TextFieldWrapper.svg?style=flat)](http://cocoapods.org/pods/TextFieldWrapper)
[![License](https://img.shields.io/cocoapods/l/TextFieldWrapper.svg?style=flat)](http://cocoapods.org/pods/TextFieldWrapper)
[![Platform](https://img.shields.io/cocoapods/p/TextFieldWrapper.svg?style=flat)](http://cocoapods.org/pods/TextFieldWrapper)

## What you can do?
    - change font and color of placeholder
    - limit textField input
    - shake animation
    - zoom in/out focus animation 
    - character range validation
    - Hoshi Effect with above feature
    - closure callback of character change in textField
    - closure callback of textFieldDidBeginEditing
    - closure callback of textFieldDidEndEditing
    - all other default features of UITextField!!!

## Zoom animation

### Clumsy view hierarchy
<img src="/Screenshots/TextFieldWrapper.gif" />

### Zoom in TableViewCell
<img src="/Screenshots/TextFiledWrapperP2.gif" />

### The Example app is cluttered to show how it performs in different/critical view hierarchy and situations. For better experience run the Example app. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
import TextFieldWrapper
```

### implement zoom in/out:
```swift
yourTextField.zoomScale = 1.4 // some value > 1 for zoomIn effect.
```
```swift
yourTextField.addBlurToView = self.view // In which view you want to add transparent blur effect.
```

### implement character changed event:
```swift
yourTextField.maxCharacter = 15
yourTextField.characterChangedEvent = { [weak self] (str, num) in
    // your implementation
}
```
### Prevent Trimming and check validation
```swift
yourTextField.maxCharacter = 15
yourTextField.shouldTrim = false
yourTextField.characterChangedEvent = { [weak self] (str, num) in
// your implementation
}
let flag = yourTextField.isValid
```

### shake animation can be accessed in 3 ways:
1. 
```swift
yourTextField.shake()
```
2. 
```swift
yourTextField.shake(borderColor: .red, borderWidth: 2.0)
```
3. 
```swift
yourTextField.shake(borderColor: .red, borderWidth: 4, completion: { 
[weak self] in
//your implementation
})
```

run the Example project, you will have a clean idea. 


## Requirements
    iOS 9
    Swift 3
    Xcode 8

## Installation

### Pod
TextFieldWrapper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TextFieldWrapper"
```
### Manual
Just drag and drop the TextFieldWrapper folder to your project.

## Author

S.M.Moinuddin, shuvn.eee@gmail.com

## License

TextFieldWrapper is available under the MIT license. See the LICENSE file for more info.
