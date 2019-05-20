//
//  SRHDetailTableViewController.h
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRHPlaylist;

NS_ASSUME_NONNULL_BEGIN



@interface SRHDetailTableViewController : UITableViewController

@property (nonatomic,strong) SRHPlaylist *playlist;

@end

NS_ASSUME_NONNULL_END
