//
//  ZLPopMenuView.h
//  ProductionLibrary
//
//  Created by czl on 2017/5/25.
//  Copyright © 2017年 sharkcome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLMenu.h"
#import "Masonry.h"

#define cellHeight  30

typedef void(^clickMenuCallBack)(NSUInteger index);

@interface ZLPopMenuView : UIImageView

- (instancetype)initWithMenus:(NSArray<ZLMenu*>*)menus callBack:(clickMenuCallBack)callBack;

@end
