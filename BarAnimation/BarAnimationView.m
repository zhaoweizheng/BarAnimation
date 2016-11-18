//
//  BarAnimationView.m
//  BarAnimation
//
//  Created by zwz on 2016/11/16.
//  Copyright © 2016年 赵伟争. All rights reserved.
//

#import "BarAnimationView.h"
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
@interface BarAnimationView ()
{
    BOOL isLoops; //是否循环
}
@end

@implementation BarAnimationView


-(instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
         [self initialization];
    }
    return self;
}

//初始化
- (void)initialization {
    self.backgroundColor = [UIColor clearColor];//背景颜色, 即导航栏的颜色
    //isLoops = YES;
    //创建条形数目
    [self createBars];
}

//首次显示的状态
- (void)createBars {

    NSInteger numberBar = 4;//个数
    CGFloat   barWidth  = 2.0;//宽度
    CGFloat   padding   = (self.bounds.size.width - barWidth*numberBar)/5;//bar之间的宽度
    CGFloat   barHight = 0.0; //高度
    CGFloat   barX     = 0.0; //X坐标
    for (int i = 0; i < numberBar; i++) {
        switch (i) {
            case 0:
            {
                barX     = (self.bounds.size.height-padding*2)/2+padding;
                barHight = (self.bounds.size.height-padding*2)/2;
            }
                break;
            case 1:
            {
                barX     = padding;
                barHight = (self.bounds.size.height-padding*2);
            }
                break;
            case 2:
            {
                barX     = (self.bounds.size.height-padding*2)/2;
                barHight = (self.bounds.size.height-padding*2)/2+padding;
            }
                break;
            case 3:
            {
                barX     = padding*2;
                barHight = (self.bounds.size.height-padding*3);
            }
                break;
            default:
                break;
        }
        UIView *barView = [[UIView alloc] initWithFrame:CGRectMake( padding + (barWidth+padding)*i, barX , barWidth, barHight)];
        barView.backgroundColor = [UIColor whiteColor];
        barView.layer.cornerRadius = 1;
        barView.layer.masksToBounds = YES;
        [self addSubview:barView];
    }
}

- (void)startAnimation {
    isLoops = YES;
    for (int i = 0; i < self.subviews.count; i++) {
        [self animationWithBarIndex:i];
    }
}

- (void)animationWithBarIndex:(NSInteger)index {
    
    CGFloat   padding      = (self.bounds.size.width - 2.5*4)/5;
    __block CGRect frame   = self.subviews[index].frame;
    NSInteger randomNumber = arc4random() % 75 + 5;
    CGFloat defaultHight   = frame.size.height-padding*2;
    CGFloat currentHeight  = self.bounds.size.height*randomNumber/100.0; //每次高度
    __block CGFloat pp = padding; //
    NSInteger randomDuration = arc4random() % 25 + 10; //随机数, 可以让每次虚幻的动画持续时间都不同
    //UIViewAnimationOptionCurveEaseOut 由慢到快 UIViewAnimationOptionCurveEaseIn 由慢到特别快
    //animateWithDuration 动画的持续时间
    [UIView animateWithDuration:randomDuration/100.0
                          delay:0.0
                        options:defaultHight >= currentHeight ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         frame.size.height = currentHeight;
                         frame.origin.y = self.bounds.size.height - frame.size.height - pp;
                         self.subviews[index].frame = frame;
                     } completion:^(BOOL finished) {
                         //重复
                         if (isLoops) {
                             [self animationWithBarIndex:index];
                         }
                     }];
}

- (void)stopAnimation {
    isLoops = NO;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createBars];
}



@end
