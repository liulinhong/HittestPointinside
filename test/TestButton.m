//
//  TestButton.m
//
//  Created by LiuLinhong on 16/4/6.
//  Copyright © 2016年 Belync. All rights reserved.
//

#import "TestButton.h"

@implementation TestButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *touchView = self;
    if ([self pointInside:point withEvent:event])
    {
        if ([self.subviews count] > 0)
        {
            for (NSInteger i = ([self.subviews count] - 1); i >= 0; --i) // UIView *subView in self.subviews)
            {
                UIView *subView = self.subviews[i];
                //注意，这里有坐标转换，将point点转换到subview中，好好理解下
                CGPoint subPoint = CGPointMake(point.x - subView.frame.origin.x,
                                               point.y - subView.frame.origin.y);
                UIView *subTouchView = [subView hitTest:subPoint withEvent:event];
                if (subTouchView)
                {
                    //找到touch事件对应的view，停止遍历
                    touchView = subTouchView;
                    break;
                }
            }
        }
    }
    else
    {
        //此点不在该View中，那么连遍历也省了，直接返回nil
        touchView = nil;
    }
    
    return touchView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return CGRectContainsPoint(self.bounds, point);
}

@end
