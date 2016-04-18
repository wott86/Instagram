//
//  InstagramObject.m
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "InstagramObject.h"

@implementation InstagramObject

-(instancetype)initWithDictionary:(NSDictionary *)userInfo {
    self = [super  init];
    
    if (self) {
        
        self.id = userInfo[kInstagramIDKey];
        self.tags = userInfo[kInstagramTagsKey];
        
        if ([userInfo[kInstagramCaptionKey] isKindOfClass:[NSDictionary class]]) {
            self.caption = userInfo[kInstagramCaptionKey][kInstagramCaptionTextKey];
        }
        
        self.author = userInfo[kInstagramUserKey][kInstagramUserUsernameKey];
        
        self.photo = [NSURL URLWithString:userInfo[kInstagramImagesKey][kInstagramImagesPhotoKey][kInstagramImagesURLKey]];
        self.photo_thumbnail = [NSURL URLWithString:userInfo[kInstagramImagesKey][kInstagramImagesThumbnailKey][kInstagramImagesURLKey]];
        NSTimeInterval time = [userInfo[kInstagramCreatedKey] doubleValue];
        self.date = [NSDate dateWithTimeIntervalSince1970:time];
        
    }
    
    return self;
}

-(NSString *)dateToString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"EEE, dd MMM YYYY' at 'hh:mm"];
    return [dateFormatter stringFromDate:self.date];
}

-(NSString *)tagsToString {
    NSString *tags;
    for (NSString *tag in self.tags) {
        if ([tags length] > 0) {
            tags = [tags stringByAppendingString:[NSString stringWithFormat:@", #%@",tag]];
        }else {
            tags = [NSString stringWithFormat:@"#%@",tag];
            
        }
        
    }
    return tags;
}

@end
