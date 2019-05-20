//
//  SRHPlaylistController.h
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRHPlaylist.h"
#import "SRHSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface SRHPlaylistController : NSObject

@property (nonatomic, strong, readonly) NSArray* playlists;

+ (SRHPlaylistController *) shared;

//Create
- (void) createPlaylistWithName:(NSString*)name;

//Delete
- (void) deletePlaylistWithName:(SRHPlaylist*)playlist;

//Add song to playlist
- (void) addSongWithTitle:(NSString*)title andArtist:(NSString*)artist toPlaylist:(SRHPlaylist*)playlist;

//Remove song
- (void) removeSong:(SRHSong*)song fromPlaylist:(SRHPlaylist*)playlist;

@end

NS_ASSUME_NONNULL_END
