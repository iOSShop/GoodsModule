//
//  GoodsDetailViewController.m
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import "GoodsDetailViewController.h"

@interface GoodsDetailViewController ()
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"商品详情";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textLabel];
    
    self.textLabel.text = [NSString stringWithFormat:@"商品%@的详情", self.goodsID];
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
