//
//  ViewController.m
//  Demo
//
//  Created by Benjamin McMurrich on 26/11/13.
//  Copyright (c) 2013 Benjamin McMurrich. All rights reserved.
//

#import "ViewController.h"
#import "NSString+RemoteControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self needsDisplay];
}

-(void) needsDisplay {
    self.label1.text = [@"Hello world!" remoteControlled];
    self.label2.text = [@"What's up!" remoteControlKey:@"A_KEY"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sync:(id)sender {
    [NSString syncRemoteControlledStringsWithURL:@"http://mcmurrich.fr/remote/demo.json" completion:^(id JSON, NSError *error) {
        [self needsDisplay];
    }];
}

- (IBAction)undo:(id)sender {
    [NSString syncRemoteControlledStringsWithURL:@"http://mcmurrich.fr/remote/no_file.json" completion:^(id JSON, NSError *error) {
        [self needsDisplay];
    }];
}
@end
