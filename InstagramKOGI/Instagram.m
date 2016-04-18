//
//  Instagram.m
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "Instagram.h"
#import "InstagramObject.h"
#import "NetworkManager.h"

@implementation Instagram

+(void)getInstagramFeedCompletion:(void (^)(id responseObject, NSError *error))completion {
    
    [[NetworkManager sharedInstance] GET:kInstagramFeedEndPoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *instagramObjects = [NSMutableArray array];
        
        for (NSDictionary *userInfo in responseObject[@"data"]) {
            
            InstagramObject *instagram = [[InstagramObject alloc] initWithDictionary:userInfo];
            
            [instagramObjects addObject:instagram];
            
        }
        
        if (completion) completion(instagramObjects,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (completion) completion(task,error);
        
    }];
}

@end
