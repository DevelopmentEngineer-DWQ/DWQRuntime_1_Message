//
//  Cat.m
//  DWQRuntime_1_Message
//
//  Created by 杜文全 on 17/3/18.
//  Copyright © 2017年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "Cat.h"

@implementation Cat
-(void)eat{

    NSLog(@"对象方法---我要吃鱼了");

}
+(void)eat{

   NSLog(@"类方法---我要吃鱼了");
}
@end
