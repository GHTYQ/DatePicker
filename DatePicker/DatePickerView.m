//
//  DatePickerView.m
//  DatePicker
//
//  Created by 田彦卿 on 2018/5/16.
//  Copyright © 2018年 TYQ. All rights reserved.
//

#import "DatePickerView.h"

@interface DatePickerView()
//日期选择器
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
//滚动显示的时间
@property(nonatomic,strong)NSString *currentDateStr;
@end

@implementation DatePickerView
-(void)awakeFromNib{
    [super awakeFromNib];
     self.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-300, [UIScreen mainScreen].bounds.size.width, 300);
    //设置地区-中国
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //设置当前显示时间 默认显示当前时间
//    [self.datePicker setDate:[NSDate date] animated:YES];
    //设置显示最大时间(此处为当前时间)
//    [self.datePicker setMaximumDate:[NSDate date]];
    //监听datePicker的滚动
    [self.datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
}
/**
 *  设置日期显示模式
 */
-(void)setDateType:(NSInteger)dateType{
    _dateType=dateType;
    switch (_dateType) {
        case 0://年月日
            self.datePicker.datePickerMode=UIDatePickerModeDate;
            break;
        case 1://时分
            self.datePicker.datePickerMode=UIDatePickerModeTime;
            break;
        case 2://月日  时分
            self.datePicker.datePickerMode=UIDatePickerModeDateAndTime;
            break;
        default:
            break;
    }
}
/**
 *取消按钮的点击事件
 */
- (IBAction)cancleBtnClicked:(id)sender {
    [self removeFromSuperview];
}
/**
 *确定按钮的点击事件
 */
- (IBAction)sureBtnClicked:(id)sender {
    if (!self.currentDateStr) {
        self.currentDateStr=[self changeDateToDateStr:[NSDate date]];
    }
    self.sureBlcok(self.currentDateStr);
    [self removeFromSuperview];
}
-(void)dateChange:(UIDatePicker*)datePicker{
    self.currentDateStr=[self changeDateToDateStr:datePicker.date];
}
+(instancetype)returnDatePickerView{
    return [[NSBundle mainBundle]loadNibNamed:@"DatePickerView" owner:nil options:nil].firstObject;
}
-(NSString *)changeDateToDateStr:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (self.dateType) {
        case 0:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case 1:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case 2:
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            break;
            
        default:
            break;
    }
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}
@end
