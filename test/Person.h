//
//  Person.h
//  test
//
//  Created by zhou on 2022/1/25.
//

#import <Foundation/Foundation.h>
#import "Human.h"

// NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//告诉编译器这是一个class，帮助减少编译，其他地方可以使用指针调用该类
@class Person;

@interface Person : Human {
	@public int age;
}


//-是用来区分函数原型和方法声明的一种方式，函数原型中没有现行短线
- (int) findAge:(NSString*) name;
- (int) findMoney:(NSString*)name card:(NSString*)card;
+ (NSString *)what;
// 这种方法外部不能访问
void justTest(void);

//atomic,nonatomic 保证下面的方法的原子性

//readwrite，就是告诉编译器，同时生成getter和setter。如果是readonly，只生成getter

//Storage内存管理特性，最常用到strong、weak、assign、copy，
//strong对应java中的强引用，weak对应java中的弱引用，copy表示复制出来一份内容，而不只是引用内存地址，
//assign作用和weak类似，唯一区别是：如果对象A被销毁，所有指向这个对象A的assign属性并不会自动设置为nil。这时候这些属性就变成野指针，再访问这些属性，程序就会crash。
//retain和strong属性一致，是非ARC时代的特性，只是现在还没有删掉

//getter= 和 setter= 重命名get和set方法

/*
   https://www.jianshu.com/p/035977d1ba89
   Nullability
   nullable：对象「可为空」
   nonnull：对象「不可为空」
   null_unspecified：「未指定」
   null_resettable：稍有点难理解，就是调用setter去reset属性时，可以传入nil，但是getter返回值，不为空。UIView下面的tintColor，就是null_resettable。这样就保证，即使赋值为nil，也会返回一个非空的值。
 */



@property (nullable) NSString* testProperty;

// 使用 @property修饰之后，就可以点方法来引用了
@property int height;

@end

NS_ASSUME_NONNULL_END
