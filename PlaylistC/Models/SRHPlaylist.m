//
//  SRHPlaylist.m
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHPlaylist.h"

@interface SRHPlaylist()
@property (nonatomic, strong) NSMutableArray* internalSongs;

@end

@implementation SRHPlaylist

- (instancetype) initWithName:(NSString *)name songs:(NSArray *)songs
{
    self = [super init];
    if (self){
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

//MARK: - Methods

- (void)addSongsObject:(SRHSong *)object
{
    [self.internalSongs addObject:object];
}

- (void)removeSongsObject:(SRHSong *)object
{
    [self.internalSongs removeObject:object];
}

- (NSArray *)songs
{
    return self.internalSongs;
}

@end
