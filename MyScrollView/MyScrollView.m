//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Steele on 2015-11-02.
//  Copyright © 2015 Steele. All rights reserved.
//

#import "MyScrollView.h"


@implementation MyScrollView


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [self addGestureRecognizer:self.panGestureRecognizer];
        
        CGSize tempSize = CGSizeMake(self.frame.size.width , 760);
        self.contentSize = tempSize;
    }
    return self;
}


- (void)panGesture:(UIPanGestureRecognizer *)sender {
    
    CGRect bounds = self.bounds;
    CGPoint translation = [sender translationInView:self];
    
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    [sender setTranslation:CGPointZero inView:self];
    
}


@end
