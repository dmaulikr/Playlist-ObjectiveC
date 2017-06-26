//
//  PlaylistDetailTableViewController.h
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Playlist.h"

@interface PlaylistDetailTableViewController : UITableViewController

@property (nonatomic, strong) Playlist *playlist;

@end
