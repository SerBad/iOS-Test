//
//  main.m
//  test
//
//  Created by zhou on 2022/1/25.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSString* myString = @"我是字符串";
    NSString* anotherString = [NSString stringWithFormat:@"%d %@", 1, @"String"];
    // 从一个C语言字符串创建Objective-C字符串
    NSString*  fromCString = [NSString stringWithCString:"A C string" encoding:NSASCIIStringEncoding];
    NSLog(@"%@ %@ %@", myString, anotherString, fromCString );
    //
    int i = 3;
    float f = 4;
    double d = 4;
    char c= 'c';
    bool b =YES;
    //动态类型，到运行时才确定类型，可是这也要初始化啊 ,格式符%p
//    id obj  = [MyClass new ];
    
    NSLog(@"%i %f %f %c %s ", i, f, d,  c , b ? "Yes" : "No"  );
    NSLog(@"Bool value: %d", b );
    return 0;
}
