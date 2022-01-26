//
//  Person.h
//  test
//
//  Created by zhou on 2022/1/25.
//

#import <Foundation/Foundation.h>
#import "Human.h"

NS_ASSUME_NONNULL_BEGIN

//告诉编译器这是一个class，帮助减少编译，其他地方可以使用指针调用该类
@class Person;

@interface Person : Human{
   @public int age;
}
 
//-是用来区分函数原型和方法声明的一种方式，函数原型中没有现行短线
- (int) findAge:(NSString*) name;
- (int) findMoney:(NSString*)name card:(NSString*)card;
@end

NS_ASSUME_NONNULL_END
