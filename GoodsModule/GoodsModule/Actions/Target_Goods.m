//
//  Target_Goods.m
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import "Target_Goods.h"

#import "GoodsMineListViewController.h"
#import "GoodsDetailViewController.h"

@implementation Target_Goods
/**
 *我的商品列表
 **/
- (UIViewController *)Action_nativeMineListViewController {
    return [[GoodsMineListViewController alloc] init];
}
/**
 *商品详情
 **/
- (UIViewController *)Action_nativeDetailViewControllerWithParams:(NSDictionary *)params {
    GoodsDetailViewController *detailViewController = [[GoodsDetailViewController alloc] init];
    detailViewController.goodsID = params[@"goodsID"];
    return detailViewController;
}
@end
