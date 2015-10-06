//
//  ViewController.m
//  alaram
//
//  Created by Sathish Chinniah on 09/08/15.
//  Copyright (c) 2015 sathish chinniah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    dateTimePicker.date = [NSDate date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil]];
    }
    
    return YES;
}




-(void) presentMessage: (NSString *) message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alaram Clock" message:message delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
    
}

-(void)scheduleLocalNotificationWithDate: (NSDate *) fireDate {
    
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    //[notification release];
    
    notification.fireDate = fireDate;
    notification.alertBody = @"Time TO wake up:";
    notification.soundName = @"clock.mp3";
    
    [[UIApplication sharedApplication] scheduleLocalNotification: notification];

}

-(IBAction)alaramSetButtonTapped:(id)sender {
    
   
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
  // dateformatter.locale = [NSLocale systemLocale];
    dateformatter.timeZone = [NSTimeZone defaultTimeZone];
    dateformatter.locale = [NSLocale systemLocale];
    dateformatter.timeStyle = NSDateFormatterShortStyle;
    dateformatter.dateStyle = NSDateFormatterShortStyle;
    
    
    NSString *dateTimeString = [dateformatter stringFromDate: dateTimePicker.date];
    
     NSLog(@"alaram button tapped: %@", dateTimePicker);
    //[dateformatter release];
    [self scheduleLocalNotificationWithDate: dateTimePicker.date];
    [self presentMessage:@"Alaram Set!"];
    
    
}

-(IBAction)alaramCancelButtonTapped:(id)sender {
    
    NSLog(@"alaram  cancel button tapped");
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [self presentMessage:@"Alaram Canceled"];
    
    
}





@end
