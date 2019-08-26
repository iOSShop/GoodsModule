//
//  GoodsDetailViewController.m
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import <OrderModule_Category/CCMediator+OrderModule.h>

@interface GoodsDetailViewController ()
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"商品详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"购买" style:UIBarButtonItemStylePlain target:self action:@selector(clickBuy)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textLabel];
    
    self.textLabel.text = [NSString stringWithFormat:@"商品%@的详情", self.goodsID];
}

- (void)clickBuy {
    __weak __typeof(self)weakSelf = self;
    UIViewController *viewController = [[CCMediator sharedInstance] Order_viewControllerForMakeWithGoodsID:self.goodsID goodsCount:99 success:^(NSString * _Nonnull successString) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.textLabel.text = successString;
    }];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.textLabel.frame = CGRectMake(0, 200, self.view.bounds.size.width, 50);
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

@end
