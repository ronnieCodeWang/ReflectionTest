//
//  TestThreeViewController.m
//  ReflectionTest
//
//  Created by Sunell on 2019/2/1.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import "TestThreeViewController.h"

@interface TestThreeViewController ()
{
    UILabel *_userName;
    UILabel *_age;
}
@end

@implementation TestThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"TestThree";
    [self initUi];
}

-(void)initUi{
    [self.view addSubview:_userName];
    [self.view addSubview:_age];
}


-(void)testThree{
    _userName = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    _age = [[UILabel alloc] initWithFrame:CGRectMake(100, 180, 100, 60)];
    _userName.text = _nameThree;
    _age.text = [NSString stringWithFormat:@"%ld",_ageThree];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
