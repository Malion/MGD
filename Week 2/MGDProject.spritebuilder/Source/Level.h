//
//  Level.h
//  MGDProject
//
//  Created by Jesse James on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Level : CCNode <CCPhysicsCollisionDelegate>
{
    OALSimpleAudio *soundEffects;
    SystemSoundID PlaySoundID;
    CCPhysicsNode *_physicsNode;
    CCSprite *_hero;
    CCSprite *_goblin;
    CCButton *axe;
    CCNode *_ground1;
    CCNode *_ground2;
    NSArray *_grounds;
    NSMutableArray *_obstacles;
}

@end
