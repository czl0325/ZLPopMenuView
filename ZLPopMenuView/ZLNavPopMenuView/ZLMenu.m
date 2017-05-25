//
//  ZLMenu.m
//  ProductionLibrary
//
//  Created by czl on 2017/5/25.
//  Copyright © 2017年 sharkcome. All rights reserved.
//

#import "ZLMenu.h"

@implementation ZLMenu

+ (ZLMenu*)createMenu:(NSString*)image title:(NSString*)title {
    ZLMenu* obj = [[ZLMenu alloc]init];
    obj.imageName = image;
    obj.title = title;
    return obj;
}

@end
