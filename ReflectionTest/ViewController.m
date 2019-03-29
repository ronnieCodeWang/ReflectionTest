//
//  ViewController.m
//  ReflectionTest
//
//  Created by Sunell on 2019/2/1.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>


@interface ViewController ()
{
    NSArray *_dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 60, 40);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _dataArr = [NSArray new];
    _dataArr = @[@{@"className" : @"TestOneViewController",@"propertys" : @{ @"_nameOne":@"李四",@"_ageOne": @21 },@"method" : @"testOne"},@{@"className" : @"TestTwoViewController",@"propertys" : @{ @"_nameTwo":@"王五",@"_ageTwo": @35 },@"method" : @"testTwo"},@{@"className" : @"TestThreeViewController",@"propertys" : @{ @"_nameThree":@"赵六",@"_ageThree": @44 },@"method" : @"testThree"}];
    
}

-(void)click{
    int x = arc4random() % 3;
    
    NSDictionary *dic = _dataArr[x];
    Class cal = NSClassFromString(dic[@"className"]);
    ViewController *vc = [cal new];
    NSDictionary *nameAgeDic = dic[@"propertys"];
    
    
    int count;
    Ivar *list = class_copyIvarList([vc class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = list[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([[nameAgeDic allKeys] containsObject:key]) {
            [vc setValue:nameAgeDic[key] forKey:key];
        }
        NSLog(@"%@",[NSString stringWithUTF8String:ivar_getName(ivar)]);
//        if ( [nameAgeDic objectForKey:[NSString stringWithUTF8String:ivar_getName(ivar)]]) {
//            [vc setValue:[nameAgeDic objectForKey:[NSString stringWithUTF8String:ivar_getName(ivar)]] forKey:[NSString stringWithUTF8String:ivar_getName(ivar)]];
//        }
    }
    
    
//    [nameAgeDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    //          [vc setValue:obj objectForKey:key];
//
//    }];
    [self.navigationController pushViewController:vc animated:YES];
    
    if ([vc respondsToSelector:NSSelectorFromString(dic[@"method"])]) {
        [vc performSelector:NSSelectorFromString(dic[@"method"])];
    }
    
    
}

@end
