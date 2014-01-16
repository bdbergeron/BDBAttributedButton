//
//  BTButton.m
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


NSString * const BTButtonCornerRadiusName = @"com.bradbergeron.BTButtonCornerRadiusName";
NSString * const BTButtonFillColorName    = @"com.bradbergeron.BTButtonFillColorName";
NSString * const BTButtonBorderColorName  = @"com.bradbergeron.BTButtonBorderColorName";
NSString * const BTButtonBorderWidthName  = @"com.bradbergeron.BTButtonBorderWidthName";


#pragma mark -
@interface BTButton ()

@property (nonatomic) NSMutableDictionary *styleAttributes;

@end


#pragma mark -
@implementation BTButton

#pragma mark View Lifecycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _styleAttributes = [NSMutableDictionary dictionary];

        self.contentEdgeInsets = [[[self class] appearance] contentEdgeInsets];
        if (UIEdgeInsetsEqualToEdgeInsets(self.contentEdgeInsets, UIEdgeInsetsZero))
            self.contentEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [super setBackgroundImage:[self btbutton_backgroundImageForState:self.state] forState:self.state];
}

#pragma mark Attributes
- (void)setStyleAttributes:(NSDictionary *)attributes forControlState:(UIControlState)state
{
    self.styleAttributes[@(state)] = attributes;
    [self setNeedsLayout];
}

- (NSDictionary *)styleAttributesForControlState:(UIControlState)state
{
    return self.styleAttributes[@(state)];
}

#pragma mark Background Images
- (UIImage *)btbutton_backgroundImageForState:(UIControlState)state
{
    static NSCache *_backgroundImages;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _backgroundImages = [NSCache new];
    });

    NSDictionary *attributes = self.styleAttributes[@(self.state)];
    if (!attributes)
        return nil;

    CGFloat radius = [attributes[BTButtonCornerRadiusName] floatValue];

    UIColor *fillColor = attributes[BTButtonFillColorName];
    if (!fillColor)
        fillColor = [UIColor clearColor];

    UIColor *borderColor = attributes[BTButtonBorderColorName];
    if (!borderColor)
        borderColor = [UIColor clearColor];

    CGFloat borderWidth = [attributes[BTButtonBorderWidthName] floatValue];

    NSString *identifier = [NSString stringWithFormat:@"%@BackgroundImage_r%0.2f_f%@_b%@_w%0.2f",
                            NSStringFromClass([self class]), radius,
                            btbutton_NSStringFromUIColor(fillColor), btbutton_NSStringFromUIColor(borderColor),
                            borderWidth];
    UIImage *image = [_backgroundImages objectForKey:identifier];
    if (!image)
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
        CGContextRef context = UIGraphicsGetCurrentContext();

        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
        CGContextAddPath(context, path.CGPath);
        CGContextClip(context);

        [fillColor set];
        [path fill];

        [borderColor set];
        path.lineWidth = borderWidth;
        [path stroke];

        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        [_backgroundImages setObject:image forKey:identifier];
    }
    return image;
}

static inline NSString *btbutton_NSStringFromUIColor(UIColor *color)
{
    if (!color)
        return nil;

    const CGFloat *c = CGColorGetComponents(color.CGColor);
    if (CGColorGetNumberOfComponents(color.CGColor) == 2)
        return [NSString stringWithFormat:@"{%f, %f}", c[0], c[1]];
    else
        return [NSString stringWithFormat:@"{%f, %f, %f, %f}", c[0], c[1], c[2], c[3]];
}

@end
