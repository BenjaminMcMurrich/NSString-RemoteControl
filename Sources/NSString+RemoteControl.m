//
//  NSString+RemoteControl.m
//
//  Created by Benjamin McMurrich on 26/11/13.
//  Copyright (c) 2013 Benjamin McMurrich. All rights reserved.
//

#import "NSString+RemoteControl.h"

#define kUserDefaultRemoteControlKey @"RemoteControlledStrings"

@implementation NSString (RemoteControl)

+(void) syncRemoteControlledStringsWithURL:(NSString*)url {
    [NSString syncRemoteControlledStringsWithURL:url completion:nil];
}

+(void) syncRemoteControlledStringsWithURL:(NSString*)url completion:(void (^)(id JSON, NSError* error))block {
    
    @try {
        NSURLRequest* request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *request, NSData *data, NSError *error) {
            
            if (error) {
                if(block) block(nil,error);
            } else {
                NSError *serializationError = nil;
                NSDictionary* JSON = [NSJSONSerialization  JSONObjectWithData:data options:0 error:&serializationError];
                
                if (JSON) {
                    [[NSUserDefaults standardUserDefaults] setObject:JSON forKey:kUserDefaultRemoteControlKey];
                } else {
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserDefaultRemoteControlKey];
                }
                [[NSUserDefaults standardUserDefaults] synchronize];
                if(block) block(JSON,serializationError);
            }
        }];
    }
    @catch (NSException *exception) {
        NSError * error = [[NSError alloc] initWithDomain:[[NSURL URLWithString:url] host] code:0 userInfo:@{NSLocalizedDescriptionKey: exception.description}];
        if(block) block(nil,error);
    }
}

-(NSString*) remoteControlled {
    return [self remoteControlKey:self];
}

-(NSString*) remoteControlKey:(NSString*)key {
    @try {
        NSDictionary * remoteStrings = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultRemoteControlKey];
        if(remoteStrings) {
            if([remoteStrings objectForKey:key]) return [remoteStrings objectForKey:key];
        }
        return self;
    }
    @catch (NSException *exception) {
        return self;
    }
}

@end
