//
//  UIImage.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "ExtensionUIImage.h"


@implementation UIImage (UIGraphics)

- (UIImage*) imageByResizingToSize: (CGSize) size
{
    UIGraphicsBeginImageContext (size);
    [self drawInRect: CGRectMake (.0, .0, size.width, size.height)];
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return result;
}

- (UIImage*) imageByFilledWithColor: (UIColor*) color
{
    UIGraphicsBeginImageContext (self.size);
    [color set];
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGRect bounds = CGRectZero;
    bounds.size = self.size;
    CGContextTranslateCTM (context, 0, bounds.size.height);
    CGContextScaleCTM (context, 1.0, -1.0);
    CGContextClipToMask (context, bounds, self.CGImage);
    CGContextFillRect (context, bounds);
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return result;
}

+ (UIImage*) imageWithColor: (UIColor*) color size: (CGSize) size
{
    UIGraphicsBeginImageContext (size);
    CGContextRef context = UIGraphicsGetCurrentContext ();

    [color set];
    CGContextFillRect (context, CGRectMake (.0, .0, size.width, size.height));

    UIImage* image = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return image;
}

+ (UIImage*) clearImage
{
    static UIImage* image = nil;

    if (image == nil) {
        image = [UIImage imageWithColor: [UIColor clearColor] size: CGSizeMake (1.0, 1.0)];
//        [image retain];
    }
    return image;
}

+ (UIImage*) imageWithBezierPath: (UIBezierPath*) path color: (UIColor*) color backgroundColor: (UIColor*) backgroundColor
{
    UIGraphicsBeginImageContext (path.bounds.size);

    if (backgroundColor) {
        [backgroundColor set];
        [path fill];
    }
    if (color) {
        [color set];
        [path stroke];
    }

    UIImage* image = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return image;
}

+ (UIImage*) imageWithColor: (UIColor*) color
{
    CGRect rect = CGRectMake (0.0f, 0.0f, 1.0f, 1.0f);

    UIGraphicsBeginImageContext (rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext ();

    CGContextSetFillColorWithColor (context, [color CGColor]);
    CGContextFillRect (context, rect);

    UIImage* image = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();

    return image;
}

@end


@implementation UIColor (UIImage)

- (UIImage*) imageOfSize: (CGSize) size
{
    return [UIImage imageWithColor: self size: size];
}

- (UIImage*) image
{
    return [self imageOfSize: CGSizeMake (1.0, 1.0)];
}

@end


@implementation UIBezierPath (UIImage)

- (UIImage*) imageWithStrokeColor: (UIColor*) strokeColor fillColor: (UIColor*) fillColor
{
    return [UIImage imageWithBezierPath: self color: strokeColor backgroundColor: fillColor];
}

- (UIImage*) imageWithStrokeColor: (UIColor*) strokeColor
{
    return [self imageWithStrokeColor: strokeColor fillColor: nil];
}

- (UIImage*) imageWithFillColor: (UIColor*) fillColor
{
    return [self imageWithStrokeColor: nil fillColor: fillColor];
}

@end
