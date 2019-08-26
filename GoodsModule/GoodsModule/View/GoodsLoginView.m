//
//  GoodsLoginView.m
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import "GoodsLoginView.h"

@implementation GoodsLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.textLabel];
    [self addSubview:self.loginButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize textSize = CGSizeMake(self.bounds.size.width, 30);
    self.textLabel.frame = CGRectMake(0, (self.bounds.size.height - textSize.height) * 0.5, textSize.width, textSize.height);
    
    CGSize buttonSize = CGSizeMake(120, 44);
    self.loginButton.frame = CGRectMake((self.bounds.size.width - buttonSize.width) * 0.5, CGRectGetMaxY(self.textLabel.frame) + 20, buttonSize.width, buttonSize.height);
}

- (void)clickLogin {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickLogin)]) {
        [self.delegate clickLogin];
    }
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.text = @"您没有登陆";
    }
    return _textLabel;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [[UIButton alloc] init];
        _loginButton.backgroundColor = [UIColor redColor];
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end
