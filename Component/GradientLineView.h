//
//  GradientLineView.h
//  FrameWork
//
//  Created by liyuchang on 15-1-27.
//  Copyright (c) 2015年 com.Vacn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientLineView : UIView
{
    CAGradientLayer *colorLayer;
    NSInteger status;
    BOOL stop;
}
-(void)start;
-(void)stop;
@end
