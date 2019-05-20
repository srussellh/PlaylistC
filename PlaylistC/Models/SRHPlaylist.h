//
//  SRHPlaylist.h
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SRHSong;

NS_ASSUME_NONNULL_BEGIN

@interface SRHPlaylist : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong, readonly) NSArray* songs;

- (instancetype) initWithName:(NSString*)name songs:(NSArray*)songs;

- (void) addSongsObject:(SRHSong *)object;
- (void) removeSongsObject:(SRHSong *)object;



@end

NS_ASSUME_NONNULL_END
