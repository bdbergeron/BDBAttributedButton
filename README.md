# BDBAttributedButton

![iPhone Screenshot](https://dl.dropboxusercontent.com/u/6225/GitHub/BDBAttributedButton/Demo.png)

BDBAttributedButton is a UIButton subclass for iOS 7. Although many argue that one should not subclass UIButton, all BDBAttributedButton does is add a couple methods that make styling buttons in iOS applcations much simpler.

Take a look at the included demo app in order to get a full understanding of how BDBAttributedButton works.

## Installation

To use BDBAttributedButton in you projects, you can simply add `pod BDBAttributedButton, '~> 1.0.0'` to your Podfile, if you're using CocoaPods. If you prefer the manual route, just add the contents of the BDBAttributedButton folder to your project. Super simple!

## Usage

Taking inspiration from Apple's push to using NSAttributedStrings throughout iOS 7, BDBAttributedButton uses one simple method to set the style of a button. The currently supported customizations are:

* Corner Radius
* Fill Color
* Border Color
* Border Width

By using different combinations of these attributes, you can create a handful of different effects, such as a red button with a white label and a 5 pixel corner radius:

```objc
NSAttributedString *title =
    [[NSAttributedString alloc] initWithString:@"Button"
                                    attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

BDBAttributedButton *button = [BDBAttributedButton new];
[button setStyleAttributes:@{BDBAttributedButtonCornerRadiusAttribute:@(5.f),
                             BDBAttributedButtonFillColorAttribute:[UIColor red]}
           forControlState:UIControlStateNormal];
[button setAttributedTitle:title forControlState:UIControlStateNormal];
[button sizeToFit];
```

## Credits

BDBAttributedButton was created by [Bradley David Bergeron](http://www.bradbergeron.com). 
