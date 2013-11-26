//
//  NSString+RemoteControl.h
//
//  Created by Benjamin McMurrich on 26/11/13.
//  Copyright (c) 2013 Benjamin McMurrich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RemoteControl)

+(void) syncRemoteControlledStringsWithURL:(NSString*)serverUrl;
+(void) syncRemoteControlledStringsWithURL:(NSString*)serverUrl completion:(void (^)(id JSON, NSError* error))block;

-(NSString*) remoteControlled;
-(NSString*) remoteControlKey:(NSString*)key;

@end
