//
//  MBFadeSegue.m
//  MBSegueDemo
//
//  Created by Max Bothe on 01/01/15.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Max Bothe
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "MBFadeSegue.h"

@implementation MBFadeSegue

- (instancetype)initWithIdentifier:(NSString *)identifier
                            source:(UIViewController *)source
                       destination:(UIViewController *)destination
{
    self = [super initWithIdentifier:identifier source:source destination:destination];
    if (self) {
        self.duration = 0.5;
        self.delay = 0.0;
        self.options = UIViewAnimationOptionCurveEaseInOut;
    }
    return self;
}

- (void)perform
{
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;

    UIView *sourceSnapshot = [source.view snapshotViewAfterScreenUpdates:NO];
//    UIView *destinationSnapshot = [destination.view snapshotViewAfterScreenUpdates:NO];

    [source.view addSubview:destination.view];
    [source.view addSubview:sourceSnapshot];

    [UIView animateWithDuration:self.duration
                          delay:self.delay
                        options:self.options
                     animations:^{
                         sourceSnapshot.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [sourceSnapshot removeFromSuperview];
                         [self showDestinationViewController];
                     }
     ];
}

@end
