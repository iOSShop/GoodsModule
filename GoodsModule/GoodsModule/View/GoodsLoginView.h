//
//  GoodsLoginView.h
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GoodsLoginViewDelegate <NSObject>

- (void)clickLogin;

@end

@interface GoodsLoginView : UIView
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, weak) id<GoodsLoginViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
