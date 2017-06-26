//
//  PlaylistTableViewController.m
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import "PlaylistTableViewController.h"
#import "PlaylistController.h"
#import "PlaylistDetailTableViewController.h"

@interface PlaylistTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *playlistNameTextField;

@end

@implementation PlaylistTableViewController


- (IBAction)addPlaylistTapped:(UIBarButtonItem *)sender {
    [[PlaylistController sharedInstance]createPlaylistWithTitle:self.playlistNameTextField.text];
    self.playlistNameTextField.text = @"";
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];https://player.vimeo.com/video/185107869
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[PlaylistController sharedInstance].playlists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    Playlist *playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
    cell.textLabel.text = playlist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Playlist *playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
        [[PlaylistController sharedInstance] deletePlaylist:playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSongDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Playlist* playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
        PlaylistDetailTableViewController *destinationVC = (PlaylistDetailTableViewController *)segue.destinationViewController;
        destinationVC.playlist = playlist;
    }
}


@end
