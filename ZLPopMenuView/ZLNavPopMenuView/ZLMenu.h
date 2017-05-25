//
//  ZLMenu.h
//  ProductionLibrary
//
//  Created by czl on 2017/5/25.
//  Copyright © 2017年 sharkcome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLMenu : NSObject

@property(nonatomic,copy)NSString* imageName;
@property(nonatomic,copy)NSString* title;

+ (ZLMenu*)createMenu:(NSString*)image title:(NSString*)title;

@end
