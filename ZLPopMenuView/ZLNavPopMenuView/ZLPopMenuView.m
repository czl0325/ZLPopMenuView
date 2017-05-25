//
//  ZLPopMenuView.m
//  ProductionLibrary
//
//  Created by czl on 2017/5/25.
//  Copyright © 2017年 sharkcome. All rights reserved.
//

#import "ZLPopMenuView.h"

@interface ZLPopMenuView()
<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIImageView* imageView;
@property(nonatomic,copy)NSArray<ZLMenu*>* menus;
@property(nonatomic,copy)clickMenuCallBack callBack;

@end

@implementation ZLPopMenuView

- (instancetype)initWithMenus:(NSArray<ZLMenu*>*)menus callBack:(clickMenuCallBack)callBack {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        
        UIImage *oldImage = [UIImage imageNamed:@"zl_pop"];
        UIImage *newImage = [oldImage stretchableImageWithLeftCapWidth:10 topCapHeight:25];
        self.image = newImage;
        self.menus = menus;
        self.callBack = callBack;
        
        [self addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.menus.count*cellHeight);
            make.left.right.bottom.mas_equalTo(self);
        }];
    }
    return self;
}

- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ZLMenu"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZLMenu"];
        cell.backgroundColor = [UIColor clearColor];
    }
    ZLMenu* menu = self.menus[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:menu.imageName];
    cell.textLabel.text = menu.title;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"onRemoveAll" object:nil];
    if (self.callBack) {
        self.callBack(indexPath.row);
    }
}

@end
