//
//  ViewController.h
//  ChanceTab
//
//  Created by Joe Sturzenegger on 9/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *randomNumber;
@property (strong, nonatomic) IBOutlet UIButton *rollButton;
@property (strong, nonatomic) IBOutlet UIPickerView *dicePicker;

@property (strong, nonatomic) NSArray *sidesArray;
@property (nonatomic) NSInteger sides;

@property (nonatomic) NSInteger colorChangeCounter;

@end

