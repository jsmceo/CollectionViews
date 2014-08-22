//
//  Flag.h
//  CollectionViews
//
//  Created by John Malloy on 8/22/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) UIImage * image;

-(id)initWithName:(NSString *)name imageName:(NSString *)imageName;

@end
