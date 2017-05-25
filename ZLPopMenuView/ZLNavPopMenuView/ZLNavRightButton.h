//
//  ZLNavRightButton.h
//  ProductionLibrary
//
//  Created by czl on 2017/5/25.
//  Copyright © 2017年 sharkcome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLPopMenuView.h"


@interface ZLNavRightButton : UIButton

- (instancetype)initWithIcon:(UIImage*)icon title:(NSString*)title menus:(NSArray<ZLMenu*>*)menus callBack:(clickMenuCallBack)callBack;

@end
