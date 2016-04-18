//
//  NetworkManager.h
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
