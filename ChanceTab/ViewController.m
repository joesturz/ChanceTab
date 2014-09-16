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
    self.randomNumber.text = @"ChanceTap";
    self.sides = 2;
    self.colorChangeCounter = 0;
    self.diceCountArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    self.diceCount = 1;
    NSLog(@"On inintial build sides = %ld", (long)self.sides);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 7;
    }
    else
    {
        return 5;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.sidesArray objectAtIndex:row];
    }
    else
    {
        return [self.diceCountArray objectAtIndex:row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
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

    }
    else
    {
        switch (row)
        {
            case 0:
                self.diceCount = 1;
                break;
            case 1:
                self.diceCount = 2;
                break;
            case 2:
                self.diceCount = 3;
                break;
            case 3:
                self.diceCount = 4;
                break;
            case 4:
                self.diceCount = 5;
                break;
            default:
                break;
        }
    }
    NSLog(@"sides = %ld", (long)self.sides);
    NSLog(@"diceCount = %ld", (long)self.diceCount);
}
- (IBAction)clickRoll:(id)sender
{
    NSMutableArray* array = [[NSMutableArray alloc] initWithObjects:@"-",@"-",@"-",@"-",@"-", nil];
    NSInteger total = 0;
    int headCount = 0;
    int tailCount = 0;
    
    
    for (int i = 0; i < self.diceCount; i++)
    {
        NSInteger randNum = (arc4random() % self.sides) + 1;
        if (self.sides == 2)
        {
            switch (randNum)
            {
                case 1:
                    //self.randomNumber.text = @"Heads";
                    [array replaceObjectAtIndex:i withObject:@"H"];
                    headCount++;
                    break;
                case 2:
                    //self.randomNumber.text = @"Tails";
                    [array replaceObjectAtIndex:i withObject:@"T"];
                    tailCount++;
                    break;
                default:
                    break;
            }
            total = total + randNum;
        }
        else
        {
            //self.randomNumber.text = [NSString stringWithFormat:@"%ld", (long)randNum];
            total = total + randNum;
            NSString *num = [NSString stringWithFormat:@"%ld", (long)randNum];
            [array replaceObjectAtIndex:i withObject:num];
        }
        NSLog(@"Roll %d = %ld", (i+1),(long)randNum);
    }
    self.die1.text = array[0];
    self.die2.text = array[1];
    self.die3.text = array[2];
    self.die4.text = array[3];
    self.die5.text = array[4];
    
    NSLog(@"Total = %ld", (long)total);
    if (self.sides == 2)
    {
        if(headCount > tailCount)
        {
            self.randomNumber.text = @"Heads";
        }
        else if (tailCount > headCount)
        {
            self.randomNumber.text = @"Tails";
        }
        else
        {
            self.randomNumber.text = @"Draw";
        }
    }
    else
    {
        self.randomNumber.text = [NSString stringWithFormat:@"%ld", (long)total];
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
