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

#import "BTButton.h"
#import "MainViewController.h"


#pragma mark -
@interface MainViewController ()

@end


#pragma mark -
@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIFont *buttonFont = [UIFont fontWithName:@"AvenirNext-Regular" size:15.0f];

    // Button 1: Outlined
    NSAttributedString *buttonTitle = [self titleWithString:NSLocalizedString(@"Outlined Button", nil) font:buttonFont color:[UIColor redColor]];
    NSMutableAttributedString *buttonHighlightedTitle = [buttonTitle mutableCopy];
    [buttonHighlightedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(0, buttonTitle.length)];

    NSDictionary *buttonAttributes = @{BTButtonCornerRadiusName:@(10.0f), BTButtonBorderWidthName:@(1.0f), BTButtonBorderColorName:[UIColor redColor]};
    NSDictionary *buttonHighlightedAttributes = @{BTButtonCornerRadiusName:@(10.0f), BTButtonBorderWidthName:@(1.0f), BTButtonBorderColorName:[UIColor darkGrayColor]};

    BTButton *button = [[BTButton alloc] initWithFrame:CGRectMake(0.0f, 84.0f, 0.0f, 0.0f)];
    [button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
    [button setStyleAttributes:buttonAttributes forControlState:UIControlStateNormal];
    [button setAttributedTitle:buttonHighlightedTitle forState:UIControlStateHighlighted];
    [button setStyleAttributes:buttonHighlightedAttributes forControlState:UIControlStateHighlighted];
    [button sizeToFit];
    button.frame = CGRectIntegral(button.frame);
    [self centerHorizontally:button inView:self.view];
    [self.view addSubview:button];

    // Button 2: Filled On Touch
    buttonTitle = [self titleWithString:NSLocalizedString(@"Filled On Touch", nil) font:buttonFont color:[UIColor orangeColor]];
    buttonHighlightedTitle = [buttonTitle mutableCopy];
    [buttonHighlightedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, buttonTitle.length)];

    buttonAttributes = @{BTButtonCornerRadiusName:@(10.0f), BTButtonBorderWidthName:@(1.0f), BTButtonBorderColorName:[UIColor orangeColor]};
    buttonHighlightedAttributes = @{BTButtonCornerRadiusName:@(10.0f), BTButtonFillColorName:[UIColor orangeColor]};

    button = [[BTButton alloc] initWithFrame:CGRectMake(0.0f, CGRectGetMaxY(button.frame) + 16.0f, 0.0f, 0.0f)];
    [button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
    [button setStyleAttributes:buttonAttributes forControlState:UIControlStateNormal];
    [button setAttributedTitle:buttonHighlightedTitle forState:UIControlStateHighlighted];
    [button setStyleAttributes:buttonHighlightedAttributes forControlState:UIControlStateHighlighted];
    [button sizeToFit];
    button.frame = CGRectIntegral(button.frame);
    [self centerHorizontally:button inView:self.view];
    [self.view addSubview:button];

    // Button 3: Filled
    buttonTitle = [self titleWithString:NSLocalizedString(@"Filled Button", nil) font:buttonFont color:[UIColor whiteColor]];
    buttonAttributes = @{BTButtonCornerRadiusName:@(10.0f), BTButtonFillColorName:[UIColor blueColor]};

    button = [[BTButton alloc] initWithFrame:CGRectMake(0.0f, CGRectGetMaxY(button.frame) + 16.0f, 0.0f, 0.0f)];
    [button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
    [button setStyleAttributes:buttonAttributes forControlState:UIControlStateNormal];
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
    viewBounds.origin.x = (parentBounds.size.width - viewBounds.size.width) / 2.0f;
    viewToCenter.frame = viewBounds;
}

@end
