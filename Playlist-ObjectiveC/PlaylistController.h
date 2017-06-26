//
//  PlaylistController.h
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
#import "Playlist.h"

@interface PlaylistController : NSObject

+ (PlaylistController *)sharedInstance;
- (instancetype)init;

- (void)createPlaylistWithTitle:(NSString *)title;
- (void)addSongWithTitle:(NSString *) title andArtist:(NSString*) artist toPlaylist:(Playlist *)playlist;
- (void)deleteSong:(Song *)song fromPlaylist:(Playlist *)playlist;
- (void)deletePlaylist:(Playlist *)playlist;

@property (nonatomic, strong, readonly) NSArray *playlists;

@end
