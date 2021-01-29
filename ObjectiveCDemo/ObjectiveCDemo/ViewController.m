//
//  ViewController.m
//  ObjectiveCDemo
//
//  Created by 石玉龙 on 2021/1/29.
//

#import "ViewController.h"
#import "TimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)actionPush:(UIButton *)sender
{
    TimerViewController *c = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}


@end
