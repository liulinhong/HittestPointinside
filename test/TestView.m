//
//  TestView.m
//
//  Created by LiuLinhong on 16/4/6.
//  Copyright © 2016年 Belync. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *touchView = self;
    if ([self pointInside:point withEvent:event] && self.alpha >= 0.01 && !self.hidden && self.isUserInteractionEnabled)
    {
        if ([self.subviews count] > 0)
        {
            for (NSInteger i = ([self.subviews count] - 1); i >= 0; --i) //按响应层判断,从后往前判断响应层
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
