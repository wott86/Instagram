//
//  NetworkManager.m
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (instancetype)sharedInstance {
    
    static NetworkManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *URL = [NSURL URLWithString:@"https://api.instagram.com"];
        
        _sharedInstance = [[NetworkManager alloc] initWithBaseURL:URL];
        [_sharedInstance setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [_sharedInstance setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
    });
    return _sharedInstance;
}

@end
