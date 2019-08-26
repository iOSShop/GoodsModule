//
//  GoodsMineListViewController.m
//  GoodsModule
//
//  Created by Cai Cai on 2019/8/26.
//  Copyright © 2019 Cai Cai. All rights reserved.
//

#import "GoodsMineListViewController.h"
#import "GoodsDetailViewController.h"
#import "GoodsLoginView.h"

#import <AccountModule_Category/CCMediator+AccountModule.h>

@interface GoodsMineListViewController ()<UITableViewDataSource, UITableViewDelegate, GoodsLoginViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) GoodsLoginView *loginView;
@end

@implementation GoodsMineListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的商品";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.loginView];
    
    [self addLoginStatusObserve];
}

- (void)addLoginStatusObserve {
    NSString *notificationName = [[CCMediator sharedInstance] Account_nameForLoginStatusChangeNotification];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStatusChange) name:notificationName object:nil];
}

- (void)clickLogin {
    UIViewController *viewController = [[CCMediator sharedInstance] Account_viewControllerForLogin];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:viewController] animated:YES completion:nil];
}

- (void)loginStatusChange {
    BOOL isLogin = [[CCMediator sharedInstance] Account_statusForLogin];
    self.loginView.hidden = isLogin;
    if (isLogin) {
        [self.view bringSubviewToFront:self.loginView];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.loginView.frame = self.view.bounds;
    self.tableView.frame = self.view.bounds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"AccountUserCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"商品%@", self.dataArray[indexPath.section]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GoodsDetailViewController *detailViewController = [[GoodsDetailViewController alloc] init];
    detailViewController.goodsID = self.dataArray[indexPath.section];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        for (NSInteger index = 0; index < 100; index++) {
            [_dataArray addObject:[NSNumber numberWithInteger:index]];
        }
    }
    return _dataArray;
}

- (GoodsLoginView *)loginView {
    if (_loginView == nil) {
        _loginView = [[GoodsLoginView alloc] init];
        _loginView.delegate = self;
    }
    return _loginView;
}

@end
