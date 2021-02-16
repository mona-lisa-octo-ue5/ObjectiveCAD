//
//  MakeGroupAvatar.h
//  GroupAvatar
//
//  Created by 石玉龙 on 2021/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeGroupAvatar : NSObject
+ (void)groupAvatarOfThree:(NSArray *)group finished:(void (^)(NSData *groupAvatar))finished;
@end

NS_ASSUME_NONNULL_END
