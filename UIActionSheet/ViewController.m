//
//  ViewController.m
//  UIActionSheet
//
//  Created by James Border on 6/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)somethingWasTapped:(id)sender;
@end

@implementation ViewController

-(void)somethingWasTapped:(id)sender {
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to do this?"
															 delegate:self
													cancelButtonTitle:@"Cancel"
											   destructiveButtonTitle:@"OK"
													otherButtonTitles:nil];
	
	[actionSheet showInView:self.view];
	//	[actionSheet autorelease]; // nope arc
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == [actionSheet destructiveButtonIndex]) {
		NSLog(@"USER TAPPED OK");
	} else if (buttonIndex == [actionSheet cancelButtonIndex]) {
		NSLog(@"USER TAPPED CANCEL");
	}
	
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"didDismissWithButtonIndex:%i",buttonIndex);
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"willDismissWithButtonIndex:%i",buttonIndex);	
}

-(void)actionSheetCancel:(UIActionSheet *)actionSheet {
	
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIButton *bttn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[bttn setFrame:CGRectMake(10, 10, 300, 37)];
	[bttn setTitle:@"Tap here" forState:UIControlStateNormal];
	[bttn addTarget:self action:@selector(somethingWasTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:bttn];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
