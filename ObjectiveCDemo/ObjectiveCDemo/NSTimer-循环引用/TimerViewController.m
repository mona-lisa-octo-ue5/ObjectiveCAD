//
//  TimerViewController.m
//  ObjectiveCDemo
//
//  Created by 石玉龙 on 2021/1/29.
//

#import "TimerViewController.h"


@interface TimerViewController ()
@property (nonatomic, strong) NSTimer *timer,*timer2;
@property (nonatomic, strong) id target;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(fire) userInfo:nil repeats:YES];
    
    _target = [[NSObject alloc] init];
    class_addMethod([_target class], @selector(fire), class_getMethodImplementation([self class], @selector(fire)), "v@:");
    
    
}

- (void)fire
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    if (!parent) {
        [_timer invalidate];
        _timer = nil;
    }
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
