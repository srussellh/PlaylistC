//
//  SRHDetailTableViewController.m
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHDetailTableViewController.h"
#import "SRHPlaylist.h"
#import "SRHSong.h"
#import "SRHPlaylistController.h"

@interface SRHDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextField *songTextField;

@end

@implementation SRHDetailTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
 
}


- (IBAction)addButtonTapped:(id)sender {
    [[SRHPlaylistController shared] addSongWithTitle:self.songTextField.text andArtist:self.artistTextField.text toPlaylist:self.playlist];
    [self.tableView reloadData];
    self.artistTextField.text = @"";
    self.songTextField.text = @"";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    SRHSong *song = [self.playlist.songs objectAtIndex:indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
