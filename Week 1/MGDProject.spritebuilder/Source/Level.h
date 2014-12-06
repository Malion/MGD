//
//  Level.h
//  MGDProject
//
//  Created by Jesse James on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Level : CCNode
{
    SystemSoundID PlaySoundID;
    CCNode *_physicsNode;
}

@end
