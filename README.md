# BDBAttributedButton

BDBAttributedButton is a UIButton subclass for iOS 7. Although many argue that one should not subclass UIButton, all BDBAttributedButton does is add a couple methods that make styling buttons in iOS applcations much simpler.

Take a look at the included demo app in order to get a full understanding of how BDBAttributedButton works.

![iPhone Screenshot](https://dl.dropboxusercontent.com/u/6225/GitHub/BDBAttributedButton/Demo.png)

## Installation

To use BDBAttributedButton in you projects, you can simply add `pod BDBAttributedButton, '~> 1.0.0'` to your Podfile, if you're using CocoaPods. If you prefer the manual route, just add the contents of the BDBAttributedButton folder to your project. Super simple!

## Usage

Taking inspiration from Apple's push to using NSAttributedStrings throughout iOS 7, BDBAttributedButton uses one simple method to set the style of a button. The currently supported customizations are:

* Corner Radius
* Fill Color
* Border Color
* Border Width

By using different combinations of these attributes, you can create a handful of different effects, such as a red button with a white label and a 5 pixel corner radius:

```obj-c
NSAttributedString *title =
    [[NSAttributedString alloc] initWithString:@"Button"
                                    attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

BDBAttributedButton *button = [BDBAttributedButton new];
[button setStyleAttributes:@{BDBCornerRadiusAttributeName:@(5.0f),
                             BDBFillColorAttributeName:[UIColor red]}
           forControlState:UIControlStateNormal];
[button setAttributedTitle:title forControlState:UIControlStateNormal];
[button sizeToFit];
```

## Credits

Copyright (c) 2014 [Bradley David Bergeron](http://www.bradbergeron.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
