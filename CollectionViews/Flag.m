//
//  Flag.m
//  CollectionViews
//
//  Created by John Malloy on 8/22/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import "Flag.h"

@implementation Flag

-(id)initWithName:(NSString *)name imageName:(NSString *)imageName
{
    self = [super init];
    if (self)
    {
        self.name = name;
        NSString * imageFile = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        self.image = [[UIImage alloc] initWithContentsOfFile:imageFile];
    }
    return self;
    
    //This method loads the image resource file into memory. In a real scenerio you'd probably want to use lazt initlization in a custom property getter. By doing so, you defer the loading until the image is actually requested.
}




@end
