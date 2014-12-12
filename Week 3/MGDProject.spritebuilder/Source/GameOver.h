//
//  GameOver.h
//  MGDProject
//
//  Created by Jesse James on 12/5/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface GameOver : CCNode
{
    CCLabelTTF *_gameOverScore;
}

@property(nonatomic, retain)NSString *score;

@end
