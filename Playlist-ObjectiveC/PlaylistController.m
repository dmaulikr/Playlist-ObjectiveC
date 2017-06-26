//
//  PlaylistController.m
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import "PlaylistController.h"
#import "Song.h"
#import "Playlist.h"

@interface PlaylistController()

@property (nonatomic, strong) NSMutableArray *internalPlaylists;

@end

@implementation PlaylistController

+ (PlaylistController *)sharedInstance
{
    static PlaylistController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlaylistController new];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalPlaylists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createPlaylistWithTitle:(NSString *)title {
    Playlist *playlist = [[Playlist alloc] initWithName:title songs:[[NSMutableArray alloc] init]];
    [self.internalPlaylists addObject:playlist];
}

- (void)deletePlaylist:(Playlist *)playlist {
    [self.internalPlaylists removeObject:playlist];
}

- (void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPlaylist:(Playlist *)playlist {
    
    Song *song = [[Song alloc] initWithTitle:title artist:artist];
    [playlist addSongObject:song];
}

- (void)deleteSong:(Song *)song fromPlaylist:(Playlist *)playlist {
    
    [playlist removeSongObject:song];
}

#pragma mark - Properties

- (NSArray *)playlists { return self.internalPlaylists; }

@end














