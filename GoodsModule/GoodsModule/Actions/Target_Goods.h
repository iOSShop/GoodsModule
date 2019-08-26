//
//  Target_Goods.h
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_Goods : NSObject
/**
 *我的商品列表
 **/
- (UIViewController *)Action_nativeMineListViewController;
/**
 *商品详情
 **/
- (UIViewController *)Action_nativeDetailViewControllerWithParams:(NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
