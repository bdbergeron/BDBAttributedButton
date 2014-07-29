//
//  MainViewController.m
//
//  Copyright (c) 2014 Bradley David Bergeron
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "BDBAttributedButton.h"
#import "MainViewController.h"


#pragma mark -
@interface MainViewController ()

@end


#pragma mark -
@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"BDBAttributedButtonDemo", nil);

    UIFont *buttonFont = [UIFont fontWithName:@"AvenirNext-Regular" size:15.f];

    // Button 1: Outlined
    BDBAttributedButton *button = [[BDBAttributedButton alloc] initWithFrame:(CGRect){{0.f, 84.f}, CGSizeZero}];

    NSAttributedString *buttonTitle = [self titleWithString:NSLocalizedString(@"Outlined Button", nil)
                                                       font:buttonFont
                                                      color:[UIColor redColor]];

    NSMutableAttributedString *buttonHighlightedTitle = [buttonTitle mutableCopy];
    [buttonHighlightedTitle addAttribute:NSForegroundColorAttributeName
                                   value:[UIColor darkGrayColor]
                                   range:NSMakeRange(0, buttonTitle.length)];

    [button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
    [button setAttributedTitle:buttonHighlightedTitle forState:UIControlStateHighlighted];

    NSDictionary *buttonAttributes = @{
          BDBAttributedButtonCornerRadiusAttribute:@(10.f),
          BDBAttributedButtonBorderWidthAttribute:@(1.f),
          BDBAttributedButtonBorderColorAttribute:[UIColor redColor]
        };
    NSDictionary *buttonHighlightedAttributes = @{
          BDBAttributedButtonCornerRadiusAttribute:@(10.f),
          BDBAttributedButtonBorderWidthAttribute:@(1.f),
          BDBAttributedButtonBorderColorAttribute:[UIColor darkGrayColor]
        };

    [button setStyleAttributes:buttonAttributes forControlState:UIControlStateNormal];
    [button setStyleAttributes:buttonHighlightedAttributes forControlState:UIControlStateHighlighted];

    [button sizeToFit];
    button.frame = CGRectIntegral(button.frame);
    [self centerHorizontally:button inView:self.view];
    [self.view addSubview:button];

    // Button 2: Filled On Touch
    button = [[BDBAttributedButton alloc] initWithFrame:(CGRect){{0.f, CGRectGetMaxY(button.frame) + 16.f}, CGSizeZero}];

    buttonTitle = [self titleWithString:NSLocalizedString(@"Filled On Touch", nil)
                                   font:buttonFont
                                  color:[UIColor orangeColor]];

    buttonHighlightedTitle = [buttonTitle mutableCopy];
    [buttonHighlightedTitle addAttribute:NSForegroundColorAttributeName
                                   value:[UIColor whiteColor]
                                   range:NSMakeRange(0, buttonTitle.length)];

    [button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
    [button setAttributedTitle:buttonHighlightedTitle forState:UIControlStateHighlighted];

    buttonAttributes = @{
          BDBAttributedButtonCornerRadiusAttribute:@(10.f),
          BDBAttributedButtonBorderWidthAttribute:@(1.f),
          BDBAttributedButtonBorderColorAttribute:[UIColor orangeColor]
        };
    buttonHighlightedAttributes = @{
          BDBAttributedButtonCornerRadiusAttribute:@(10.f),
          BDBAttributedButtonFillColorAttribute:[UIColor orangeColor]
        };

    [button setStyleAttributes:buttonAttributes forControlState:UIControlStateNormal];
    [button setStyleAttributes:buttonHighlightedAttributes forControlState:UIControlStateHighlighted];

    [button sizeToFit];
    button.frame = CGRectIntegral(button.frame);
    [self centerHorizontally:button inView:self.view];
    [self.view addSubview:button];

    // Button 3: Filled
    button = [[BDBAttributedButton alloc] initWithFrame:(CGRect){{0.f, CGRectGetMaxY(button.frame) + 16.f}, CGSizeZero}];

    [button setAttributedTitle:[self titleWithString:NSLocalizedString(@"Filled Button", nil)
                                                font:buttonFont
                                               color:[UIColor whiteColor]]
                      forState:UIControlStateNormal];

    [button setStyleAttributes:@{BDBAttributedButtonCornerRadiusAttribute:@(10.f),
                                 BDBAttributedButtonFillColorAttribute:[UIColor blueColor]}
               forControlState:UIControlStateNormal];

    [button sizeToFit];
    button.frame = CGRectIntegral(button.frame);
    [self centerHorizontally:button inView:self.view];
    [self.view addSubview:button];
}

- (NSAttributedString *)titleWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
{
    NSParameterAssert(string);
    NSParameterAssert(font);
    NSParameterAssert(color);

    return [[NSAttributedString alloc] initWithString:string
                                           attributes:@{NSFontAttributeName:font,
                                                        NSForegroundColorAttributeName:color}];
}

- (void)centerHorizontally:(UIView *)viewToCenter inView:(UIView *)parentView
{
    CGRect parentBounds = parentView.frame;
    CGRect viewBounds = viewToCenter.frame;
    viewBounds.origin.x = (parentBounds.size.width - viewBounds.size.width) / 2.f;

    viewToCenter.frame = viewBounds;
}

@end
