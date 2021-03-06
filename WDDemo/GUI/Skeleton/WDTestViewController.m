//
//  ViewController.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDTestViewController.h"
#import "WDNavigationManager.h"
#import "WDRACTestViewModel.h"
#import "WDRACTestViewController.h"

#import "WDNetworkViewController.h"
#import "WDNetworkViewModel.h"

#import "WDCoreTextViewController.h"
#import "WDCoreTextViewModel.h"

#import "WDWebTestViewController.h"
#import "WDWebTestViewModel.h"

#import "WDFMDBViewModel.h"
#import "WDFMDBTestViewController.h"

@interface WDTestViewController ()<RETableViewManagerDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) RETableViewManager    *tableViewManager;
@property (nonatomic, strong) RETableViewSection    *tableViewSection;

@end

@implementation WDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Test";
    [self setupViews];
}

- (void)setupViews
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewManager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.tableViewSection = [RETableViewSection section];
    [self.tableViewManager addSection:self.tableViewSection];
    
    @weakify(self);
    RETableViewItem * item = [RETableViewItem itemWithTitle:@"RACTest"
                                              accessoryType:UITableViewCellAccessoryDisclosureIndicator
                                           selectionHandler:^(RETableViewItem *item) {
                                               @strongify(self);
                                               UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                                               cell.selected = NO;
                                               WDRACTestViewModel * viewModel = [[WDRACTestViewModel alloc] init];
                                               WDRACTestViewController * viewController = [[WDRACTestViewController alloc] initViewModel:viewModel];
                                               [[WDNavigationManager sharedManager] pushViewController:viewController];
                                           }];
    [self.tableViewSection addItem:item];
    
    item = [RETableViewItem itemWithTitle:@"AFNetworkTest"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                            @strongify(self);
                            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                            cell.selected = NO;
                            WDNetworkViewModel * viewModel = [[WDNetworkViewModel alloc] init];
                            WDNetworkViewController * viewController = [[WDNetworkViewController alloc] initViewModel:viewModel];
                            [[WDNavigationManager sharedManager] pushViewController:viewController];
                        }];
    [self.tableViewSection addItem:item];
    
    item = [RETableViewItem itemWithTitle:@"CoreText"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             @strongify(self);
                             UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                             cell.selected = NO;
                             WDCoreTextViewModel * viewModel = [[WDCoreTextViewModel alloc] init];
                             WDCoreTextViewController * viewController = [[WDCoreTextViewController alloc] initViewModel:viewModel];
                             [[WDNavigationManager sharedManager] pushViewController:viewController];
                         }];
    [self.tableViewSection addItem:item];
    item = [RETableViewItem itemWithTitle:@"WebTest"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             @strongify(self);
                             UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                             cell.selected = NO;
                             WDWebTestViewModel * viewModel = [[WDWebTestViewModel alloc] init];
                             WDWebTestViewController * viewController = [[WDWebTestViewController alloc] initViewModel:viewModel];
                             [[WDNavigationManager sharedManager] pushViewController:viewController];
                         }];
    [self.tableViewSection addItem:item];
    
    item = [RETableViewItem itemWithTitle:@"FMDBTest"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             @strongify(self);
                             UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                             cell.selected = NO;
                             WDFMDBViewModel * viewModel = [[WDFMDBViewModel alloc] init];
                             WDFMDBTestViewController * viewController = [[WDFMDBTestViewController alloc] initViewModel:viewModel];
                             [[WDNavigationManager sharedManager] pushViewController:viewController];
                         }];
    [self.tableViewSection addItem:item];
    
    item = [RETableViewItem itemWithTitle:@"JSPatchTest"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             @strongify(self);
                             UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                             cell.selected = NO;
                             [self gotoJSPatchTest];
                         }];
    [self.tableViewSection addItem:item];
}

- (void)gotoJSPatchTest
{
    
}

@end
