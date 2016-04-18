//
//  Instagram.h
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kInstagramFeedEndPoint @"/v1/media/popular?client_id=05132c49e9f148ec9b8282af33f88ac7"

@interface Instagram : NSObject

+(void)getInstagramFeedCompletion:(void (^)(id responseObject, NSError *error))completion;

@end
