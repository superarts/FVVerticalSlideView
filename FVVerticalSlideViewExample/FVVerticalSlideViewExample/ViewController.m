//
//  ViewController.m
//  FVVerticalSlideViewExample
//
//  Created by Fernando on 3/3/16.
//  Copyright © 2016 tato469. All rights reserved.
//

#import "ViewController.h"
#import "FVVerticalSlideView.h"
#import "FVAwesomeLabel.h"

@interface ViewController () <FVVerticalSliderViewDelegate>

@end

@implementation ViewController
{
    FVAwesomeLabel *header;
    FVVerticalSlideView *slider;
    NSString *headerTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat top = 20;
    CGFloat bottom = 50;
    
    slider = [[FVVerticalSlideView alloc] initWithTop:top
                                               bottom:bottom
                                      translationView:self.view];
    
    [slider setBackgroundColor:[UIColor darkGrayColor]];
    [slider setTopY:top];
    
    slider.delegate = self;
    
    [self.view addSubview:slider];
    
    headerTitle = @"Slider";
    
    header = [[FVAwesomeLabel alloc] initWithFrame:CGRectMake(0, 5, slider.frame.size.width, 40)];
    [header setTextAlignment:NSTextAlignmentCenter];
    [header setTextColor:[UIColor whiteColor]];
    [header setAwesomeIcon:FAArrowUp andText:[NSString stringWithFormat:@" %@",headerTitle] withFotSize:14.0f];
    [slider addSubview:header];
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerTap)];
    tapGesture.numberOfTapsRequired = 1;
    header.userInteractionEnabled = YES;
    [header addGestureRecognizer:tapGesture];
    
}

-(void) headerTap
{
    if([slider slideViewStatus] == FVStatusTop)
    {
        [slider slideToBottom];
    }
    else{
        [slider slideToTop];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FVVerticalSliderViewDelegate

-(void) startMovingSliderView
{
    
}

-(void) movingSliderView:(float)calculatedPosition
{
    
}

-(void) stopMovingSliderView:(float)calculatedPosition
{
    
}


-(void) closeTopPositionSliderView:(float)calculatedPosition
{
    [header setAwesomeIcon:FAArrowDown andText:[NSString stringWithFormat:@" %@",headerTitle] withFotSize:14.0f];
}


-(void) closeBottomPositionSliderView:(float)calculatedPosition
{
    [header setAwesomeIcon:FAArrowUp andText:[NSString stringWithFormat:@" %@",headerTitle] withFotSize:14.0f];
}

@end