//
//  GameOver.m
//  MGDProject
//
//  Created by Jesse James on 12/5/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameOver.h"
#import "Level.h"

@implementation GameOver

-(void)retryBtn:(id)sender
{
    CCScene *levelScene = [CCBReader loadAsScene:@"Level"];
    [[CCDirector sharedDirector] replaceScene:levelScene];
}

@end
