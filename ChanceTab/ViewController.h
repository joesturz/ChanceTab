//
//  ViewController.h
//  ChanceTab
//
//  Created by Joe Sturzenegger on 9/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *diebutton1;
@property (weak, nonatomic) IBOutlet UIButton *diebutton2;
@property (weak, nonatomic) IBOutlet UIButton *diebutton3;
@property (weak, nonatomic) IBOutlet UIButton *diebutton4;
@property (weak, nonatomic) IBOutlet UIButton *diebutton5;

@property (assign) BOOL isDie1Active;
@property (assign) BOOL isDie2Active;
@property (assign) BOOL isDie3Active;
@property (assign) BOOL isDie4Active;
@property (assign) BOOL isDie5Active;


@property (strong, nonatomic) IBOutlet UILabel *randomNumber;
@property (strong, nonatomic) IBOutlet UIButton *rollButton;
@property (strong, nonatomic) IBOutlet UIPickerView *dicePicker;

@property (strong, nonatomic) NSArray *sidesArray;
@property (strong, nonatomic) NSArray *diceCountArray;
@property (nonatomic) NSInteger sides;
@property (nonatomic) NSInteger diceCount;

@property (nonatomic) NSInteger colorChangeCounter;
@property (strong, nonatomic) UIColor *redColor;
@property (strong, nonatomic) UIColor *orangeColor;

@end

