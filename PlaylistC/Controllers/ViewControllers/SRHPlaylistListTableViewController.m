//
//  SRHPlaylistListTableViewController.m
//  PlaylistC
//
//  Created by Bobba Kadush on 5/20/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHPlaylistListTableViewController.h"
#import "SRHDetailTableViewController.h"
#import "SRHPlaylistController.h"


@interface SRHPlaylistListTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;


@end

@implementation SRHPlaylistListTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    [[SRHPlaylistController shared] createPlaylistWithName:self.nameTextField.text];
    [self.tableView reloadData];
    self.nameTextField.text = @"";
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[SRHPlaylistController shared] playlists] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlaylistCell" forIndexPath:indexPath];
    
    SRHPlaylist *playlist = [[[SRHPlaylistController shared] playlists] objectAtIndex:indexPath.row];
    cell.textLabel.text = [playlist name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [[playlist songs] count]];
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    //IIDOO
    if ([[segue identifier] isEqualToString:@"EditPlaylistSegue"]) {
        NSIndexPath *indexpath = self.tableView.indexPathForSelectedRow;
        SRHDetailTableViewController *destinationVC = [segue destinationViewController];
        SRHPlaylist *playlist = [[[SRHPlaylistController shared] playlists] objectAtIndex:indexpath.row];
        destinationVC.playlist = playlist;
    }
}


@end
