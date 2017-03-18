# DWQRuntime_1_Message
Runtime消息机制的简单使用
![DWQ-LOGO.jpeg](http://upload-images.jianshu.io/upload_images/2231137-1545493cd60adb2b.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##引述
  在iOS开发中，在项目中经常会发现一些奇怪的功能。不太能找的到代码的出处，但却实现了功能，很可能这是实用了黑魔法Runtime。【《一步步搭建即使通讯框架》在Runtime系列博文之后推出】，谢谢您的支持。

##Runtime简介
- Runtime简称运行时。OC就是运行时机制，也就是在运行时候的一些机制，其中最主要的是消息机制。
- 对于C语言，函数的调用在编译的时候会决定调用哪个函数。
- 对于OC的函数，属于动态调用过程，在编译的时候并不能决定真正调用哪个函数，只有在真正运行的时候才会根据函数的名称找到对应的函数来调用。
- 事实证明：
在编译阶段，OC可以调用任何函数，即使这个函数并未实现，只要声明过就不会报错。
在编译阶段，C语言调用未实现的函数就会报错。

##Runtime运用-消息机制
  我们在开发中，运用最多的就是方法的调用，其实方法调用的本质就是发送消息。假设我们定义一个Cat类，它有两个方法，一个对象方法eat；一个类方法eat；示例如下：

```objective-c
#import "Cat.h"

@implementation Cat
-(void)eat{
    NSLog(@"对象方法---我要吃鱼了");
}

+(void)eat{
   NSLog(@"类方法---我要吃鱼了");
}
@end

```
  如果我们想在一个控制器中使用这个方法，通常我们的做法是，先引入头文件"Cat.h"，如果是调用对象方法，那就用alloc先创建一个对象，再调用对象方法，如果是调用类方法，直接通过类名就可以调用。示例如下：
```objective-c
 /*调用对象方法通常做法1*/
    //  Cat *cat1=[[Cat alloc]init];
    //
    //  [cat1 eat];
    
    /*调用对象方法通常做法2*/
    Cat *cat2=[[Cat alloc]init];
    [cat2 performSelector:@selector(eat)];
    // SEL:方法编号,根据方法编号就可以找到对应方法实现，此方法其实就是运用了运行时。
    /*运行时方法*/
    
    
    /*调用类方法通常做法1*/
    [Cat eat];//通过类名调用
    
    /*调用类方法通常做法2*/
    [[Cat class]eat];//通过类对象调用

```
######其实上述方法的本质都是消息发送，那么接下来我们看用Runtime如何实现调用eat方法
- 1.第一步：引入Runtime框架import <objc/message.h>,注意，使用message，不使用<objc/runtime.h>的原因是message.h涵盖runtime，方法更全。
- 2.第二步:Build Setting -> 搜索msg -> 设置属性为No
- 3.使用objc_msgSend,方法；注意：只有对象才能发送消息，因此以objc开头.

```objective-c
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
```
##Runtime使用效果展示

![Runtime消息机制.png](http://upload-images.jianshu.io/upload_images/2231137-d06e7d5aeddf147e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##Runtime消息机制使用Demo下载地址
[Runtime消息机制Demo](https://github.com/DevelopmentEngineer-DWQ/DWQRuntime_1_Message)
广大书友在学习的同时请给个点赞，在GitHub上给个Star噢~~~~~~！
