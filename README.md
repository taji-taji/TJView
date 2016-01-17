# TJView

[![Version](https://img.shields.io/cocoapods/v/TJView.svg?style=flat)](http://cocoapods.org/pods/TJView)
[![License](https://img.shields.io/cocoapods/l/TJView.svg?style=flat)](http://cocoapods.org/pods/TJView)
[![Platform](https://img.shields.io/cocoapods/p/TJView.svg?style=flat)](http://cocoapods.org/pods/TJView)

![demo](https://github.com/taji-taji/TJView/blob/master/images/TJView_demo.gif)

## Usage

### Initialize

TJView can initialize from code or StoryBoard.

- `initWithFrame`
- `initWithCoder`


### Properties

- border width
	- `public var topBorderWidth: CGFloat`
	- `public var bottomBorderWidth: CGFloat`
	- `public var leftBorderWidth: CGFloat`
	- `public var rightBorderWidth: CGFloat`
- border color
	- `public var topBorderColor: UIColor?`
	- `public var bottomBorderColor: UIColor?`
	- `public var leftBorderColor: UIColor?`
	- `public var rightBorderColor: UIColor?`
- corner radius
	- `public var cornerRadius: CGFloat = 0`
	- `public var cornerRadiusTopLeft: Bool = false`
	- `public var cornerRadiusTopRight: Bool = false`
	- `public var cornerRadiusBottomLeft: Bool = false`
	- `public var cornerRadiusBottomRight: Bool = false`

### Methods

- `public func borderPositions(positions: [TJViewBorderPosition], borderWidth: CGFloat, borderColor: UIColor?)`
- `public func borderTop(borderWidth: CGFloat, borderColor: UIColor?)`
- `public func borderBottom(borderWidth: CGFloat, borderColor: UIColor?)`
- `public func borderLeft(borderWidth: CGFloat, borderColor: UIColor?)`
- `public func borderRight(borderWidth: CGFloat, borderColor: UIColor?)`
- `public func cornerRadiusPositions(corners: UIRectCorner, cornerWidth: CGFloat)`

### Enum

- `TJViewBorderPosition`

```swift
public enum TJViewBorderPosition {
    case Top
    case Right
    case Bottom
    case Left
}
```

### Example

#### From StoryBoard

#### From Code

```swift
// ViewController.swift

import UIKit
import TJView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRectMake(10, 200, 200, 100)
        let subView = TJView(frame: frame)
        subView.backgroundColor = UIColor.whiteColor()
        subView.topBorderWidth = 10
        subView.topBorderColor = UIColor.redColor()
        subView.cornerRadiusTopRight = true
        subView.cornerRadius = 5.5
        
        self.view.addSubview(subView)
        
        let frame2 = CGRectMake(10, 310, 250, 100)
        let subView2 = TJView(frame: frame2)
        subView2.backgroundColor = UIColor.whiteColor()
        subView2.borderPositions([.Top, .Bottom], borderWidth: 3.5, borderColor: UIColor.greenColor())
        
        self.view.addSubview(subView2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

```


## Requirements

## Installation

TJView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TJView"
```

## Author

Yutaka Tajika

## License

TJView is available under the MIT license. See the LICENSE file for more info.
