//
//  Person.m
//  test
//
//  Created by zhou on 2022/1/25.
//

#import "Person.h"

@implementation Person

- (id) init{
    NSLog(@"init");
    self = [super init];
    if (self) {
        age = 10;
    }
    return self;
}

- (void) draw{
    NSLog(@"这是执行了Person draw");
    //用来调用父类的方法，也可以用在其他方法中
    [super draw];
}

//name作为参数名，可以是不同的
- (int)findAge:(NSString *)zhou{
 
    if([zhou isEqual:@"zhou"]){
        return 2;
    }
    return age;
}

+ (NSString *)what{
    return @"what";
}

- (int)findMoney:(NSString *)name card:(NSString *)card{
    return age;
}

@end
