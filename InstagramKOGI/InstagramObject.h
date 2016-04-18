//
//  InstagramObject.h
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kInstagramIDKey @"id"
#define kInstagramCaptionKey @"caption"
#define kInstagramCaptionTextKey @"text"
#define kInstagramImagesKey @"images"
#define kInstagramImagesURLKey @"url"
#define kInstagramImagesThumbnailKey @"thumbnail"
#define kInstagramImagesPhotoKey @"standard_resolution"
#define kInstagramTagsKey @"tags"
#define kInstagramUserKey @"user"
#define kInstagramUserUsernameKey @"username"
#define kInstagramCreatedKey @"created_time"

@interface InstagramObject : NSObject

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *caption;
@property (strong, nonatomic) NSURL *photo_thumbnail;
@property (strong, nonatomic) NSURL *photo;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSArray *tags;

-(instancetype)initWithDictionary:(NSDictionary *)userInfo;

-(NSString *)dateToString;
-(NSString *)tagsToString;

@end
