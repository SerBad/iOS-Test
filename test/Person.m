//
//  Person.m
//  test
//
//  Created by zhou on 2022/1/25.
//

#import "Person.h"

@implementation Person

- (id) init {
	NSLog(@"init");
	//需要这么做，保证返回的内容
	if (self = [super init]) {
		age = 10;
	}
	return self;
}

- (void) draw {
	NSLog(@"这是执行了Person draw");
	//用来调用父类的方法，也可以用在其他方法中
	[super draw];
}

//name作为参数名，可以是不同的
- (int)findAge:(NSString *)zhou {

	if([zhou isEqual:@"zhou"]) {
		return 2;
	}
	return age;
}

//（1）加号 是可以通过类名直接调用这个方法,（+ 和java中的static 方法相似）
//（2）而减号则要实例化这个对象,然后通过实例化的对象来调用该方法!
+ (NSString *)what {
	return @"我是个静态方法";
}

- (int)findMoney:(NSString *)name card:(NSString *)card {
	return age;
}

void justTest(void){
	NSLog(@"这里只是个测试的方法");
}

- (NSString *)testProperty {
	NSLog(@"这里只是个testProperty测试的方法");
	return @"这里是为了测试@property";
}
 
- (void)setTestProperty:(NSString *)testProperty {
	NSLog(@"这里只是个setTestProperty测试的方法 %@",testProperty);
}

@end
