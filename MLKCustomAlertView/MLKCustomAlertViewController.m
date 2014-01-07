//
//  ViewController.m
//  MLKCustomAlertView
//
//  Created by NagaMalleswar on 03/01/14.
//  Copyright (c) 2014 NagaMalleswar. All rights reserved.
//

#define ALERT_TITLE         @"Customized iOS 7 Alert View"
#define OK_TITLE            @"OK"
#define VALUE_LABEL_TITLE   @"Value :"

#define LABEL_FRAME         CGRectMake(20, 70, 55, 21)
#define FIELD_FRAME         CGRectMake(85, 65, 165, 30)
#define ACTIVITY_CENTER     CGPointMake(140, 125)

#import "MLKCustomAlertViewController.h"

@interface MLKCustomAlertViewController ()

@end

@implementation MLKCustomAlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)showCustomAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:@"\n\n\n\n\n" delegate:self cancelButtonTitle:OK_TITLE otherButtonTitles:nil];
    
    
    [alertView show];
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    NSArray *subviews = [UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController.view.subviews;
    
    if( subviews.count > 1 )
    {
        // iOS while presenting an alertview uses a presening view controller. That controller's view has several subviews. I have picked one
        // subview from it which has frame similar to the alertview frame.
        UIView *presentedView = [subviews objectAtIndex:1];

        UILabel *customLabel = [[UILabel alloc] initWithFrame:LABEL_FRAME];
        customLabel.text = VALUE_LABEL_TITLE;
        
        UITextField *customField = [[UITextField alloc] initWithFrame:FIELD_FRAME];
        customField.borderStyle = UITextBorderStyleRoundedRect;
        
        UIActivityIndicatorView *customActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [customActivityIndicator startAnimating];
        customActivityIndicator.center = ACTIVITY_CENTER;
        
        [presentedView addSubview:customLabel];
        [presentedView addSubview:customField];
        [presentedView addSubview:customActivityIndicator];
    }
}

@end
