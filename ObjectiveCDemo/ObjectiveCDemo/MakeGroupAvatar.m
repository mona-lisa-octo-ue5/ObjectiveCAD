//
//  MakeGroupAvatar.m
//  GroupAvatar
//
//  Created by 石玉龙 on 2021/2/16.


#import "MakeGroupAvatar.h"
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

#define DEFAULT_AVATAR_IMAGE @"1.png"

static const CGFloat viewWidth = 45;
@implementation MakeGroupAvatar

+ (void)groupAvatarOfThree:(NSArray *)group finished:(void (^)(NSData * _Nonnull))finished
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSInteger c = group.count > 3 ? 3 : group.count;
        CGFloat width = 0.0, x = 0.0, y = 0.0;
        if (c == 1) {
            x = 0;
            y = 0;
            width = 45;
        } else if (c == 2) {
            x = 10;
            y = 10;
            width = 35;
        } else if (c == 3) {
            x = 0;
            y = 10;
            width = 35;
        }
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
        __block NSInteger count = 0;
        for (NSInteger i = 0; i < c; i++) {
            NSString *aUrl = [group objectAtIndex:i];
            if (i == 0) {
                x = 0;
                y = 0;
            } else if (i == 1) {
                x = 10;
                y = 10;
            } else if (i == 2) {
                x = 0;
                y = 10;
            }
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, width)];
            if (c > 1) {
                imageView.layer.cornerRadius = 17.5;
                imageView.layer.masksToBounds = YES;
            } else {
                imageView.layer.cornerRadius = 22.5;
                imageView.layer.masksToBounds = YES;
            }
            [view addSubview:imageView];
            [imageView sd_setImageWithURL:[NSURL URLWithString:aUrl] placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR_IMAGE] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                count ++ ;
                if (count == c) {
                    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 2.0);
                    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
                    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
                    UIGraphicsEndPDFContext();
                    CGImageRef imageRef = image.CGImage;
                    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, CGRectMake(0, 0, view.frame.size.width*2, view.frame.size.height*2));
                    UIImage *ansImage = [[UIImage alloc] initWithCGImage:imageRefRect];
                    NSData *imageViewData = UIImagePNGRepresentation(ansImage);
                    CGImageRelease(imageRefRect);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (finished) {
                            finished(imageViewData);
                        }
                });
                }
                
            }];
        }
    });
}


@end
