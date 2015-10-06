//
//  ViewController.h
//  alaram
//
//  Created by Sathish Chinniah on 09/08/15.
//  Copyright (c) 2015 sathish chinniah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    
    IBOutlet UIDatePicker *dateTimePicker;
}

-(void) presentMessage: (NSString *) message;
-(void)scheduleLocalNotificationWithDate: (NSDate *) fireDate;

-(IBAction)alaramSetButtonTapped:(id)sender;

-(IBAction)alaramCancelButtonTapped:(id)sender;




@end

