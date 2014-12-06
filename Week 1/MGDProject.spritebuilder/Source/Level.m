//
//  Level.m
//  MGDProject
//
//  Created by Jesse James on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation Level

-(void)mainSound:(id)sender
{
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    [audio playEffect:@"hmm.wav"];
}

-(void)wooshSound:(id)sender
{
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    [audio playEffect:@"whoosh1.wav"];
}

@end
