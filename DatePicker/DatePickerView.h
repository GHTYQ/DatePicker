//
//  DatePickerView.h
//  DatePicker
//
//  Created by 田彦卿 on 2018/5/16.
//  Copyright © 2018年 TYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SureBlock)(NSString*dateStr);
@interface DatePickerView : UIView
@property(nonatomic,strong)SureBlock sureBlcok;
@property(nonatomic,assign)NSInteger dateType;
+(instancetype)returnDatePickerView;
//NOTE:创建的时候用weak修饰。作用：显示的时候判断是否存在，存在不在显示。如果用strong修饰 remove 后对象仍存在。再点击就不会出现选择器。
@end
