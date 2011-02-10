//
//  FakePushViewController.m
//  FakePush
//
//  Created by Tom Horn on 8/02/11.
//  Copyright 2011 Cognethos Pty Ltd. All rights reserved.
//

#import "FakePushViewController.h"
#import "FakeImageBackground.h"

@implementation FakePushViewController

@synthesize pushMessage;

- (IBAction)onSchedule:(id)sender
{
	// schedule a push notification in 5 seconds
    UILocalNotification *localNotif = [[[UILocalNotification alloc] init] autorelease];
	
	NSMutableDictionary * userInfo = [[[NSMutableDictionary alloc] init]autorelease];
	[userInfo setObject:pushMessage.text forKey:@"alert"];
	
	localNotif.userInfo = (NSDictionary*)userInfo;
    localNotif.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
	
    localNotif.alertBody = pushMessage.text;
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
	
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 0;
		
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (IBAction)onShowimage:(id)sender
{
	// how a full screen image
	FakeImageBackground * imageController = [[FakeImageBackground new] autorelease];
	[self presentModalViewController:imageController animated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
	NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
	pushMessage.text = [[userDefaults stringForKey:@"msg"] retain];
}

- (void)viewWillDisappear:(BOOL)animated
{
	NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setObject:pushMessage.text forKey:@"msg"];
}

- (void)viewDidUnload {
}


- (void)dealloc {
	[pushMessage release];
    [super dealloc];
}

@end
