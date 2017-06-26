//
//  Song.h
//  Playlist-ObjectiveC
//
//  Created by Arnold Mukasa on 6/26/17.
//  Copyright © 2017 Arnold Mukasa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artist;

@end
