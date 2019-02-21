//
//  ViewController.m
//  ChanceTab
//
//  Created by Joe Sturzenegger on 9/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)setAllDiceToActive;
- (void)setDieColor:(UIButton *)button and:(BOOL)state to:(BOOL)value;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.sidesArray  = [[NSArray alloc] initWithObjects: @"2", @"4", @"6", @"8", @"10", @"12", @"20", nil];
  self.randomNumber.text = @"TapChance";
  self.sides = 2;
  self.colorChangeCounter = 0;
  self.diceCountArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
  self.diceCount = 1;
  //    NSLog(@"On inintial build sides = %ld", (long)self.sides);
  
  //  self.redColor = [UIColor colorWithRed:255.0f/255.0f green:248.0f/255.0f blue:103.0f/255.0f alpha:1.0f];
  self.orangeColor = [UIColor colorWithRed:253.0f/255.0f green:151.0f/255.0f blue:31.0f/255.0f alpha:1.0f];
  self.whiteColor = UIColor.whiteColor;
  
  [self setAllDiceToActive];
}

- (void)setAllDiceToActive
{
  [self setDieColor:self.diebutton1 and:self.isDie1Active to:YES];
  [self setDieColor:self.diebutton2 and:self.isDie2Active to:YES];
  [self setDieColor:self.diebutton3 and:self.isDie3Active to:YES];
  [self setDieColor:self.diebutton4 and:self.isDie4Active to:YES];
  [self setDieColor:self.diebutton5 and:self.isDie5Active to:YES];

}

-(void)setDieColor:(UIButton *)button and:(BOOL)state to:(BOOL)value
{
  state = value;
  [button setTitleColor:self.whiteColor forState:UIControlStateNormal];
  return;
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
  [self setAllDiceToActive];
  
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
  //    NSLog(@"sides = %ld", (long)self.sides);
  //    NSLog(@"diceCount = %ld", (long)self.diceCount);
}
- (IBAction)clickRoll:(id)sender
{
  NSMutableArray* array = [[NSMutableArray alloc] initWithObjects:@"-",@"-",@"-",@"-",@"-", nil];
  NSInteger total = 0;
  int headCount = 0;
  int tailCount = 0;
  
  
  for (int i = 0; i < self.diceCount; i++)
  {
    BOOL isActiveForIndex = [self shouldAddValueToArrayAtIndex:i];
    if (isActiveForIndex)
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
      //            NSLog(@"Roll %d = %ld", (i+1),(long)randNum);
    }
    else
    {
      if (self.sides == 2)
      {
        
        if ([self isTitleStringValueFromIndex:i])
        {
          [array replaceObjectAtIndex:i withObject:@"H"];
          headCount++;
        }
        else
        {
          [array replaceObjectAtIndex:i withObject:@"T"];
          tailCount++;
        }
      }
      else
      {
        int dieValue = [self getTitleIntValueFromIndex:i];
        NSString *num = [NSString stringWithFormat:@"%ld", (long)dieValue];
        [array replaceObjectAtIndex:i withObject:num];
        total = total + dieValue;
      }
    }
  }
  
  [self.diebutton1 setTitle:array[0] forState:UIControlStateNormal];
  [self.diebutton2 setTitle:array[1] forState:UIControlStateNormal];
  [self.diebutton3 setTitle:array[2] forState:UIControlStateNormal];
  [self.diebutton4 setTitle:array[3] forState:UIControlStateNormal];
  [self.diebutton5 setTitle:array[4] forState:UIControlStateNormal];
  
  //    NSLog(@"Total = %ld", (long)total);
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
    self.randomNumber.textColor = self.orangeColor;
  }
  else
    self.randomNumber.textColor = self.whiteColor;
  //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}
-(int)getTitleIntValueFromIndex:(int)i
{
  switch (i)
  {
    case 0:
      return [self.diebutton1.currentTitle intValue];
    case 1:
      return [self.diebutton2.currentTitle intValue];
    case 2:
      return [self.diebutton3.currentTitle intValue];
    case 3:
      return [self.diebutton4.currentTitle intValue];
    case 4:
      return [self.diebutton5.currentTitle intValue];
    default:
      return NO;
  }
}
-(BOOL)isTitleStringValueFromIndex:(int)i
{
  switch (i)
  {
    case 0:
      return [self.diebutton1.currentTitle isEqualToString:@"H"];
    case 1:
      return [self.diebutton2.currentTitle isEqualToString:@"H"];
    case 2:
      return [self.diebutton3.currentTitle isEqualToString:@"H"];
    case 3:
      return [self.diebutton4.currentTitle isEqualToString:@"H"];
    case 4:
      return [self.diebutton5.currentTitle isEqualToString:@"H"];
    default:
      return NO;
  }
}

-(BOOL)shouldAddValueToArrayAtIndex:(int) i
{
  switch (i)
  {
    case 0:
      return self.isDie1Active;
    case 1:
      return self.isDie2Active;
    case 2:
      return self.isDie3Active;
    case 3:
      return self.isDie4Active;
    case 4:
      return self.isDie5Active;
    default:
      return NO;
  }
}

-(void)newRollForDieNumber:(int)i
{
  
}

-(IBAction)die1Tapped:(id)sender
{
  if (self.isDie1Active)
  {
    self.isDie1Active = NO;
    [self.diebutton1 setTitleColor:self.orangeColor forState:UIControlStateNormal];
  }
  else
  {
    self.isDie1Active = YES;
    [self.diebutton1 setTitleColor:self.whiteColor forState:UIControlStateNormal];
  }
}
-(IBAction)die2Tapped:(id)sender
{
  if (self.isDie2Active)
  {
    self.isDie2Active = NO;
    [self.diebutton2 setTitleColor:self.orangeColor forState:UIControlStateNormal];
  }
  else
  {
    self.isDie2Active = YES;
    [self.diebutton2 setTitleColor:self.whiteColor forState:UIControlStateNormal];
  }
  
}
-(IBAction)die3Tapped:(id)sender
{
  if (self.isDie3Active)
  {
    self.isDie3Active = NO;
    [self.diebutton3 setTitleColor:self.orangeColor forState:UIControlStateNormal];
  }
  else
  {
    self.isDie3Active = YES;
    [self.diebutton3 setTitleColor:self.whiteColor forState:UIControlStateNormal];
  }
  
}
-(IBAction)die4Tapped:(id)sender
{
  if (self.isDie4Active)
  {
    self.isDie4Active = NO;
    [self.diebutton4 setTitleColor:self.orangeColor forState:UIControlStateNormal];
  }
  else
  {
    self.isDie4Active = YES;
    [self.diebutton4 setTitleColor:self.whiteColor forState:UIControlStateNormal];
  }
  
}
-(IBAction)die5Tapped:(id)sender
{
  if (self.isDie5Active)
  {
    self.isDie5Active = NO;
    [self.diebutton5 setTitleColor:self.orangeColor forState:UIControlStateNormal];
  }
  else
  {
    self.isDie5Active = YES;
    [self.diebutton5 setTitleColor:self.whiteColor forState:UIControlStateNormal];
  }
  
}



@end
