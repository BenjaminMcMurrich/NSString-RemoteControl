//
//  ViewController.h
//  Demo
//
//  Created by Benjamin McMurrich on 26/11/13.
//  Copyright (c) 2013 Benjamin McMurrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
- (IBAction)sync:(id)sender;
- (IBAction)undo:(id)sender;

@end
