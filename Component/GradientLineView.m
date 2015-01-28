//
//  GradientLineView.m
//  FrameWork
//
//  Created by liyuchang on 15-1-27.
//  Copyright (c) 2015年 com.Vacn. All rights reserved.
//

#import "GradientLineView.h"

@implementation GradientLineView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        colorLayer = [CAGradientLayer layer];
        colorLayer.frame = self.bounds;
        [self.layer addSublayer:colorLayer];
    }
    return self;
}

- (void)didMoveToSuperview {
    
    UIColor *color1 = [UIColor colorWithRed:87/255.0 green:154/255.0 blue:229/255.0 alpha:1];
    UIColor *color2 = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
    NSArray *colors = [NSArray arrayWithObjects:(id)[color1 CGColor],[color2 CGColor],[color1 CGColor],nil];
    CAGradientLayer *gLayer = colorLayer;
    gLayer.colors = colors;
    gLayer.locations = @[@(0),@(0),@(0)];
    gLayer.startPoint = CGPointMake(0, 0);
    gLayer.endPoint = CGPointMake(1, 0);
    status = 0;
}


-(CABasicAnimation *)cycle0
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"locations"];
    anim.toValue = @[@(0.9),@(2),@(2)];
    anim.duration = 1;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    return anim;
}


-(CABasicAnimation *)cycle3
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"locations"];
    anim.fromValue =
    anim.toValue = @[@(0),@(0),@(0)];
    anim.duration = 0.1;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.delegate = self;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    return anim;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (stop) return;
    switch (status) {
        case 0:
            status=3;
            [colorLayer addAnimation:[self cycle0] forKey:@"13"];
            break;
        case 3:
            status = 0;
            [colorLayer addAnimation:[self cycle3] forKey:@"13"];
            break;
        default:
            break;
    }
}
-(void)start
{
    stop = NO;
    [self animationDidStop:nil finished:nil];
}

-(void)stop
{
    stop = YES;
    [colorLayer removeAllAnimations];
}
- (void)dealloc
{
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}
@end
