//
//  PlaylistDetailTableViewController.m
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import "PlaylistDetailTableViewController.h"
#import "PlaylistController.h"

@interface PlaylistDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *songNameTextField;

@end

@implementation PlaylistDetailTableViewController


- (IBAction)addTapped:(UIBarButtonItem *)sender {
    [[PlaylistController sharedInstance]addSongWithTitle:self.songNameTextField.text andArtist:self.artistNameTextField.text toPlaylist:self.playlist];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.playlist.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    Song *song = self.playlist.songs[indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Song *song = self.playlist.songs[indexPath.row];
        [[PlaylistController sharedInstance] deleteSong:song fromPlaylist:self.playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Properties

- (void)setPlaylist:(Playlist *)playlist {
    if (playlist != _playlist) {
        _playlist = playlist;
        [self.tableView reloadData];
    }
}


@end
