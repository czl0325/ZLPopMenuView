# ZLPopMenuView
IOS类似QQ的导航栏右上角弹出更多菜单。


![image](https://github.com/czl0325/ZLPopMenuView/blob/master/ZLPopMenuView.png?raw=true)


调用方法：

导入
#import "ZLNavRightButton.h"

调用：
```Objective-C
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZLNavRightButton* btn = [[ZLNavRightButton alloc]initWithIcon:[UIImage imageNamed:@"QP_more"] title:nil menus:@[[ZLMenu createMenu:@"QP_AllSelect" title:@"全选"],[ZLMenu createMenu:@"QP_delete" title:@"删除"],[ZLMenu createMenu:@"QP_edit" title:@"编辑"],[ZLMenu createMenu:@"QP_collect" title:@"收藏"]] callBack:^(NSUInteger index) {
        //你要实现的事件
    }];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,[[UIBarButtonItem alloc]initWithCustomView:btn]];
}
```
