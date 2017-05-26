//
//  ViewController.m
//  ZLPopMenuView
//
//  Created by zhaoliang chen on 2017/5/25.
//  Copyright © 2017年 zhaoliang chen. All rights reserved.
//

#import "ViewController.h"
#import "ZLNavRightButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZLNavRightButton* btn = [[ZLNavRightButton alloc]initWithIcon:[UIImage imageNamed:@"QP_more"] title:nil menus:@[[ZLMenu createMenu:@"QP_AllSelect" title:@"全选"],[ZLMenu createMenu:@"QP_delete" title:@"删除"],[ZLMenu createMenu:@"QP_edit" title:@"编辑"],[ZLMenu createMenu:@"QP_collect" title:@"收藏"]] callBack:^(NSUInteger index) {
        
    }];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,[[UIBarButtonItem alloc]initWithCustomView:btn]];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
