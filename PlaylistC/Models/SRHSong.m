//
//  SRHSong.m
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHSong.h"

@implementation SRHSong

- (instancetype) initWithTitle:(NSString *)title artist:(NSString *)artist
{
    self = [super init];
    if (self){
        _title = title;
        _artist = artist;
    }
    return self;
}

@end
