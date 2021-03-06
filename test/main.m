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

void testBasicLanguage(void){
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

	NSLog(@"%i %f %f %c %s ", count, f, d,  c, b ? "Yes" : "No"  );
	NSLog(@"Bool value: %d", b );

	const char *word[4] = {"aaa","bbbb","ccccc","dddddd"};

	for (int i =0; i<4; i++) {
		//因为strlen返回的是size_t类型，所以用%zd
		NSLog(@"for value: %i %s %zd", i, word[i],strlen(word[i]));
	}


	//方括号，用于通知某个对象该去做什么，第一项是对象，其余部分是需要对象执行的操作
	Person *person = [Person new];
	//以下方法和上面的方法等价
	//Person *person = [[Person alloc]init];

	[person draw];
	[person setTestProperty:@"我是个参数"];

	NSLog(@" person->age %i", person->age);
	NSLog(@" person.testProperty %@", person.testProperty);

	NSLog(@" [Person what] %@",  [Person what]);

	NSLog(@"person %i %i  ", [person findAge:@"zhou"], [person findAge:@"wu"]  );
}

void testFoundationMain(void){
	NSError *error = nil;
	NSStringEncoding encoding = NSUTF8StringEncoding;
	//http://www.stats.gov.cn/tjsj/zxfb/202105/t20210510_1817180.html
	NSString *string =  [[NSString alloc]initWithContentsOfFile:@"/Users/zhou/Documents/ios/test/test/words.txt" encoding:encoding error:&error];
//	NSLog(@"解析字段：%@ %@ ",string,error);

	//方法三(正确，可打印emoji)
	NSRange range;
	NSMutableArray* array5 = [NSMutableArray arrayWithCapacity:1];
	NSString* temp = [NSString new];
	NSMutableArray* tempArray = [NSMutableArray arrayWithCapacity:1];

	for(int i=0; i<string.length; i+=range.length) {
		range = [string rangeOfComposedCharacterSequenceAtIndex:i];
		NSString *s = [string substringWithRange:range];

		//https://www.cnblogs.com/hecheng0314/p/4664175.html
//		temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%c",[string characterAtIndex:i]]];
//        temp = [temp stringByAppendingFormat:@"%c",[string characterAtIndex:i]];

		if([s isEqual:@"\n"]) {
			if (tempArray.count>=4) {
				[array5 addObject:[NSMutableArray arrayWithArray:tempArray] ];
				temp = @"";
				[tempArray removeAllObjects];
			}

			if (temp.length>0) {
				[tempArray addObject:temp];
				temp = @"";
			}
		} else {
			if(![s isEqual:@"\n"]) {
				temp = [temp stringByAppendingFormat:@"%@",s];
			}
		}

//		NSLog(@"s--->%@",s);

	}


	//用来把NSSting 转成 NSNumber
	NSNumberFormatter* f = [NSNumberFormatter new];
	f.numberStyle = NSNumberFormatterDecimalStyle;

	NSArray* array6 = [array5 sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult (id obj1, id obj2){
	                           NSMutableArray* obj11 = obj1;
	                           NSMutableArray* obj22 = obj2;
	                           NSNumber* value1 = [f numberFromString:[obj11 objectAtIndex:3]];
	                           NSNumber* value2 =  [f numberFromString:[obj22 objectAtIndex:3]];
	                           return [value2 compare:value1];
			   }];
	array5 = [NSMutableArray arrayWithArray:array6];
	[array5 insertObject:@[@"全　国",@"男比重",@"女比重",@"性别比"] atIndex:0];
	for (int i = 0; i< array5.count; i++) {
		NSLog(@"array5 %@", [array5[i] componentsJoinedByString:@"-"]);
	}

}

void testArray(void){
	//NSArray是Cocoa下面的类，只能存储Cocoa下面的对象，不能为nil
	//NSArray的便利初始化
	NSArray* array1 = [[NSArray alloc] initWithObjects:@"aaa", @"bbb", @"ccc", nil];
	//NSArray的便利构造器
	NSArray* array2 = [NSArray arrayWithObjects:@"111", @"222", @"333", nil];

	NSArray* array3 = @[@"!!!", @"@@@", @"###" ];

	for (int i = 0; i<array1.count; i++) {
		NSLog(@"array1 %@", array1[i]);
	}

	for (int i = 0; i< array2.count; i++) {
		NSLog(@"array2 %@", array2[i]);
	}

	for (int i = 0; i< array3.count; i++) {
		NSLog(@"array3 %@", array3[i]);
	}


	NSString* string =[array3 componentsJoinedByString:@" :-) "];
	NSLog(@"string %@",string);
	NSArray* array4 = [string componentsSeparatedByString:@" :-) "];
	for (int i = 0; i< array4.count; i++) {
		NSLog(@"array4 %@", array4[i]);
	}

	float floatValue = 0;
	NSLog(@"字符串转float %f", [@"1.1" floatValue]);


	//arrayWithCapacity只是个参考值，并不是最后的数量
	//
	NSMutableArray* array5 = [NSMutableArray arrayWithCapacity:1];
	[array5 addObject:@"我是个可变的一号"];
	[array5 insertObject:@"我是可变的老板" atIndex:0];

	//用NSNull来表示空的
	[array5 addObject:[NSNull null]];

	NSInteger valueInt = 123;
	NSNumber* value1 = @1;
	NSNumber* value2 = [NSNumber numberWithInteger:valueInt];
	[array5 addObject:value1];
	[array5 addObject:value2];

	for (int i = 0; i< array5.count; i++) {
		NSLog(@"array5 %@", array5[i]);
	}

}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		// insert code here...
		NSLog(@"Hello, World!");
	}

//	testBasicLanguage();
	testFoundationMain();
//	testArray();
	return 0;
}


