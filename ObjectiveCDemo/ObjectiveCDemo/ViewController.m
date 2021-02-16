//
//  ViewController.m
//  ObjectiveCDemo
//
//  Created by 石玉龙 on 2021/1/29.
//

#import "ViewController.h"
#import "TimerViewController.h"
#import "MakeGroupAvatar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self greateGroupAvatarThree];
}

- (void)greateGroupAvatarThree
{
    NSArray *ary = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490344686500&di=9d25111a6e55f1f43bc5ae21e9ba10f2&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F72f082025aafa40fe871b36bad64034f79f019d4.jpg",@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1794894692,1423685501&fm=117&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1350614941,725003865&fm=117&gp=0.jpg"];
    UIImageView *canvasView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 45, 45)];
    [MakeGroupAvatar groupAvatarOfThree:ary finished:^(NSData *groupAvatar) {
        canvasView.image = [UIImage imageWithData:groupAvatar];
    }];
    [self.view addSubview:canvasView];
}

- (IBAction)actionPush:(UIButton *)sender
{
    TimerViewController *c = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}


@end
