//
//  ViewController.h
//  ChanceTab
//
//  Created by Joe Sturzenegger on 9/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *die1;
@property (strong, nonatomic) IBOutlet UILabel *die2;
@property (strong, nonatomic) IBOutlet UILabel *die3;
@property (strong, nonatomic) IBOutlet UILabel *die4;
@property (strong, nonatomic) IBOutlet UILabel *die5;
@property (strong, nonatomic) IBOutlet UILabel *randomNumber;
@property (strong, nonatomic) IBOutlet UIButton *rollButton;
@property (strong, nonatomic) IBOutlet UIPickerView *dicePicker;

@property (strong, nonatomic) NSArray *sidesArray;
@property (strong, nonatomic) NSArray *diceCountArray;
@property (nonatomic) NSInteger sides;
@property (nonatomic) NSInteger diceCount;

@property (nonatomic) NSInteger colorChangeCounter;

@end

