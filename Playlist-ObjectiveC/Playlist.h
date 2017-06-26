//
//  Playlist.h
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Song;

@interface Playlist : NSObject

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, readonly) NSArray *songs;

- (void)addSongObject:(Song *)song;
- (void)removeSongObject:(Song *)song;

@end
