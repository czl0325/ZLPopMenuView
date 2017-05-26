//
//  ZLNavRightButton.m
//  ProductionLibrary
//
//  Created by czl on 2017/5/25.
//  Copyright © 2017年 sharkcome. All rights reserved.
//

#import "ZLNavRightButton.h"

@interface ZLNavRightButton()
<UIGestureRecognizerDelegate>
{
    UIView* backView;
}

@property(nonatomic,strong)ZLPopMenuView* menuView;
@property(nonatomic,copy)NSArray<ZLMenu*>* menus;
@property(nonatomic,copy)clickMenuCallBack callBack;

@end

@implementation ZLNavRightButton

- (instancetype)initWithIcon:(UIImage*)icon title:(NSString*)title menus:(NSArray<ZLMenu*>*)menus callBack:(clickMenuCallBack)callBack {
    self = [self initWithFrame:CGRectMake(0, 0, 100, 30)];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRemoveAll:) name:@"onRemoveAll" object:nil];
        if (icon!=nil) {
            if (title.length>0) {
                self.frame = CGRectMake(0, 0, icon.size.width+[title boundingRectWithSize:CGSizeMake(1000000, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size.width+10, 30);
            } else {
                self.frame = CGRectMake(0, 0, 30, 30);
            }
        } else {
            self.frame = CGRectMake(0, 0, [title boundingRectWithSize:CGSizeMake(1000000, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size.width+10, 30) ;
        }
        [self setImage:icon forState:UIControlStateNormal];
        [self addTarget:self action:@selector(onClickNavRight) forControlEvents:UIControlEventTouchUpInside];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitle:title forState:UIControlStateNormal];
        
        self.menus = menus;
        self.callBack = callBack;
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)onClickNavRight {
    backView = [[UIView alloc]initWithFrame:CGRectZero];
    backView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    backView.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([UIApplication sharedApplication].keyWindow.rootViewController.view);
    }];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onHide:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    //tap.delegate = self;
    [backView addGestureRecognizer:tap];
    
    self.menuView = [[ZLPopMenuView alloc]initWithMenus:self.menus callBack:self.callBack];
    self.menuView.alpha = 0.0f;
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self.menuView];
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(70);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(0);
    }];
    
    [self performSelector:@selector(showMenu) withObject:nil afterDelay:0.1f];
}

- (void)showMenu {
    [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.menus.count*cellHeight+10);
    }];
    
    [UIView animateWithDuration:0.2f animations:^{
        self.menuView.alpha = 1.0f;
        [[UIApplication sharedApplication].keyWindow.rootViewController.view layoutIfNeeded];
    }];
}

- (void)onHide:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        [self onRemoveAll:nil];
    }
}

- (void)onRemoveAll:(NSNotification*)sender {
    [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.menuView.alpha = 0.0f;
        [[UIApplication sharedApplication].keyWindow.rootViewController.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (self.menuView) {
            [self.menuView removeFromSuperview];
            self.menuView = nil;
        }
        if (backView) {
            [backView removeFromSuperview];
            backView = nil;
        }
    }];
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if([NSStringFromClass([touch.view class])isEqual:@"UITableViewCellContentView"]){
//        return NO;
//    }
//    return YES;
//}




@end
