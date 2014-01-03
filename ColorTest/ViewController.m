//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController
@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;
@synthesize colorView;
@synthesize activityIndicator;

-(IBAction)onColorSliderChanged:(id)sender
{
    if([activityIndicator isAnimating])
    {
        [activityIndicator stopAnimating];
    }
    colorView.backgroundColor = [UIColor colorWithRed:redSlider.value green:greenSlider.value
 blue:blueSlider.value alpha:1.0];
}
-(IBAction)powerOnOff:(id)sender
{
    BOOL isOn = ((UISwitch*)sender).on;
    
    redSlider.enabled =isOn;
    greenSlider.enabled =isOn;
    blueSlider.enabled = isOn;
    
    activityIndicator.hidesWhenStopped=YES;
    
    if(isOn)
    {
        [activityIndicator startAnimating];
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
    }
    else{
        colorView.backgroundColor=[UIColor grayColor];
    }
    
}
-(void) viewDidAppear:(BOOL)animated
{
    [self onColorSliderChanged:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
