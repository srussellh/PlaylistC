//
//  SRHPlaylistController.m
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHPlaylistController.h"

@interface SRHPlaylistController()
@property (nonatomic, strong, readwrite) NSMutableArray* internalPlaylists;

@end


@implementation SRHPlaylistController

+ (SRHPlaylistController*)shared
{
    static SRHPlaylistController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [SRHPlaylistController new];
    });
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalPlaylists = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (NSArray *)playlists
{
    return self.internalPlaylists;
}

- (void)createPlaylistWithName:(NSString *)name
{
    SRHPlaylist *newPlaylist = [[SRHPlaylist alloc] initWithName:name songs:[NSMutableArray new]];
    [self.internalPlaylists addObject:newPlaylist];
}

- (void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPlaylist:(SRHPlaylist *)playlist
{
    SRHSong *newSong = [[SRHSong alloc] initWithTitle:title artist:artist];
    [playlist addSongsObject:newSong];
}

- (void)deletePlaylistWithName:(SRHPlaylist *)playlist
{
    [self.internalPlaylists removeObject:playlist];
}

- (void)removeSong:(SRHSong *)song fromPlaylist:(SRHPlaylist *)playlist
{
    [playlist removeSongsObject:song];
}

@end
