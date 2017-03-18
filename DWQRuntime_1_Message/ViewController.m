//
//  ViewController.m
//  DWQRuntime_1_Message
//
//  Created by 杜文全 on 17/3/18.
//  Copyright © 2017年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "ViewController.h"
#import "Cat.h"
#import <objc/message.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*调用对象方法通常做法1*/
    //  Cat *cat1=[[Cat alloc]init];
    //
    //  [cat1 eat];
    
    /*调用对象方法通常做法2*/
    //Cat *cat2=[[Cat alloc]init];
    //[cat2 performSelector:@selector(eat)];
    // SEL:方法编号,根据方法编号就可以找到对应方法实现，此方法其实就是运用了运行时。
    /*运行时方法*/
    
    
    /*调用类方法通常做法1*/
    //[Cat eat];//通过类名调用
    
    /*调用类方法通常做法2*/
    //[[Cat class]eat];//通过类对象调用
    
    //运行时方法
    // 运行时,发送消息,谁做事情就拿谁
    // xcode5之后,苹果不建议使用底层方法
    // xcode5之后,使用运行时.
    
    // 让cat发送消息-对象
    Cat *cat3=[[Cat alloc]init];
    
    objc_msgSend(cat3, @selector(eat));

    //类方法使用runtime
    
    // 获取类对象
    Class catClass = [Cat class];
    
    // 运行时
    objc_msgSend(catClass, @selector(eat));

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
