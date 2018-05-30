//
//  ViewController.m
//  DatePicker
//
//  Created by 田彦卿 on 2018/5/16.
//  Copyright © 2018年 TYQ. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerView.h"
@interface ViewController ()
@property(nonatomic,strong)UIDatePicker *dataPicker;
@property(nonatomic,weak)DatePickerView *datePickerV;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)btnClicked:(UIButton *)sender {
    __weak typeof (self) weakSelf = self;
    if (!self.datePickerV) {
        self.datePickerV=[DatePickerView returnDatePickerView];
        self.datePickerV.dateType=2;
        self.datePickerV.sureBlcok = ^(NSString *dateStr) {
            [weakSelf.dateBtn setTitle:dateStr forState:UIControlStateNormal];
        };
        [self.view addSubview:self.datePickerV];
    }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
