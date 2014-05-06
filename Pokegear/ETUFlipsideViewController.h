//
//  ETUFlipsideViewController.h
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETUFlipsideViewController;

@protocol ETUFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(ETUFlipsideViewController *)controller;
@end

@interface ETUFlipsideViewController : UIViewController

@property (weak, nonatomic) id <ETUFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
