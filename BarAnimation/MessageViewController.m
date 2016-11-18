//
//  MessageViewController.m
//  Prect
//
//  Created by apple on 16/11/12.
//  Copyright © 2016年 赵伟争. All rights reserved.
//

#import "MessageViewController.h"
#import "BarAnimationView.h"
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface MessageViewController ()
{
    BarAnimationView *barView;
}
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 2, 30, 30);
    
    
    barView = [[BarAnimationView alloc] initWithFrame:button.frame];
    [button addSubview:barView];
    
    //监听按钮点击
    [button addTarget:self action:@selector(dimiss) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(100, 300, 50, 30);
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    [playButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //监听按钮点击
    [playButton addTarget:self action:@selector(playButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stopButton.frame = CGRectMake(200, 300, 50, 30);
    [stopButton setTitle:@"停止" forState:UIControlStateNormal];
    [stopButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //监听按钮点击
    [stopButton addTarget:self action:@selector(stopButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    // Do any additional setup after loading the view.
}

- (void)playButton {
    [barView startAnimation];
}

- (void)stopButton {
     [barView stopAnimation];
}

- (void)dimiss {


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
