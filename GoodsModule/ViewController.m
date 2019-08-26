//
//  ViewController.m
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import "ViewController.h"
#import "GoodsMineListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickButton:(id)sender {
    GoodsMineListViewController *listViewController = [[GoodsMineListViewController alloc] init];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:listViewController] animated:YES completion:nil];
}

@end
