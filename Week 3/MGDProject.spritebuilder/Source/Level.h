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
    CCButton *_pauseBtn;
    CCNode *_ground1;
    CCNode *_ground2;
    CCNode *puff;
    CCLabelTTF *_score;
    NSArray *_grounds;
    NSMutableArray *_obstacles;
}

@end
