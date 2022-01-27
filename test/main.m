//
//  main.m
//  test
//
//  Created by zhou on 2022/1/25.
//

#import <Foundation/Foundation.h>
#import "Person.h"

BOOL areIntsDiffrent(void){
    return false;
}
 
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
    int count = 5;
    float f = 4;
    double d = 4;
    char c= 'c';
    bool b = areIntsDiffrent();
    //动态类型，到运行时才确定类型，可是这也要初始化啊 ,格式符%p
    //id即表示泛型
//    id obj  = [MyClass new ];
    
    NSLog(@"%i %f %f %c %s ", count, f, d,  c , b ? "Yes" : "No"  );
    NSLog(@"Bool value: %d", b );
    
    const char *word[4] = {"aaa","bbbb","ccccc","dddddd"};
 
    for (int i =0; i<4; i++) {
        //因为strlen返回的是size_t类型，所以用%zd
        NSLog(@"for value: %i %s %zd", i, word[i] ,strlen(word[i]));
    }
    
    
    //方括号，用于通知某个对象该去做什么，第一项是对象，其余部分是需要对象执行的操作
    Person *person = [Person new];
    //以下方法和上面的方法等价
    //Person *person = [[Person alloc]init];

    [person draw];
 
    NSLog(@"person %i %i  ", [person findAge:@"zhou"], [person findAge:@"wu"]  );
    
 
    NSError *error = nil;
    NSStringEncoding encoding = NSUTF8StringEncoding;
    NSString *string =  [[NSString alloc]initWithContentsOfFile:@"/Users/zhou/Documents/ios/test/test/words.txt" encoding:encoding error:&error];
    NSLog(@"解析字段：%@ %@ ",string,error);
    
    return 0;
}
