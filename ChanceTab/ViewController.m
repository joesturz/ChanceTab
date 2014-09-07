//
//  ViewController.m
//  ChanceTab
//
//  Created by Joe Sturzenegger on 9/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.sidesArray  = [[NSArray alloc] initWithObjects: @"2", @"4", @"6", @"8", @"10", @"12", @"20", nil];
    self.randomNumber.text = @"Random";
    self.sides = 2;
    self.colorChangeCounter = 0;
    NSLog(@"On inintial build sides = %ld", (long)self.sides);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.sidesArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (row)
    {
        case 0:
            self.sides = 2;
            break;
        case 1:
            self.sides = 4;
            break;
        case 2:
            self.sides = 6;
            break;
        case 3:
            self.sides = 8;
            break;
        case 4:
            self.sides = 10;
            break;
        case 5:
            self.sides = 12;
            break;
        case 6:
            self.sides = 20;
            break;
        default:
            break;
    }
    NSLog(@"sides = %ld", (long)self.sides);
}
- (IBAction)clickRoll:(id)sender
{
    NSInteger randNum = (arc4random() % self.sides) + 1;
    
    if (self.sides == 2)
    {
        switch (randNum)
        {
            case 1:
                self.randomNumber.text = @"Heads";
                break;
            case 2:
                self.randomNumber.text = @"Tails";
                break;
            default:
                break;
        }
    }
    else
    {
        self.randomNumber.text = [NSString stringWithFormat:@"%ld", (long)randNum];
    }
    self.colorChangeCounter++;
    if (self.colorChangeCounter % 2 == 0) {
        self.randomNumber.textColor = [UIColor blueColor];
    }
    else
        self.randomNumber.textColor = [UIColor redColor];
    //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}



@end
