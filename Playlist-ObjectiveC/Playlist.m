//
//  Playlist.m
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import "Playlist.h"

@interface Playlist();

@property (nonatomic, strong) NSMutableArray *internalSongs;

@end

@implementation Playlist

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs {
    self = [super init];
    if (self) {
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

- (NSArray *)songs {return self.internalSongs;}

- (void)addSongObject: (Song *)song {
    [self.internalSongs addObject:song];
}

-(void)removeSongObject: (Song *)song {
    [self.internalSongs removeObject:song];
}

@end
