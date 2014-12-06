//
//  Level.m
//  MGDProject
//
//  Created by Jesse James on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level.h"
#import "GameOver.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

static const CGFloat scrollSpeed = 180.f;
static const CGFloat firstObstaclePosition = 280.f;
static const CGFloat distanceBetweenObstacles = 160.f;
float randomScale = 1.f;

@implementation Level

-(void)spawnNewObstical
{
    CCNode *previousObstacle = [_obstacles lastObject];
    CGFloat previousObstacleXPosition = previousObstacle.position.x;
    if(!previousObstacle)
    {
        previousObstacleXPosition = firstObstaclePosition;
    }
    CCNode *obstacle = [CCBReader load:@"Obstacle"];
    obstacle.scale = (float)rand() / RAND_MAX+.5;
    NSLog(@"%f", obstacle.scale);
    obstacle.position = ccp(previousObstacleXPosition + distanceBetweenObstacles, 70.f);
    [_physicsNode addChild:obstacle];
    [_obstacles addObject:obstacle];
}

-(void)update:(CCTime)delta {
    //distanceBetweenObstacles = (arc4random()%(250-1))+1;
    _hero.position = ccp(_hero.position.x + delta * scrollSpeed, _hero.position.y);
    _physicsNode.position = ccp(_physicsNode.position.x - (scrollSpeed *delta), _physicsNode.position.y);
    for(CCNode *ground in _grounds)
    {
        CGPoint groundWorldPosition = [_physicsNode convertToWorldSpace:ground.position];
        CGPoint groundScreenPosition = [self convertToNodeSpace:groundWorldPosition];
        if(groundScreenPosition.x <= (-1 * ground.contentSize.width))
        {
            ground.position = ccp(ground.position.x + 2 * ground.contentSize.width, ground.position.y);
        }
    }
    NSMutableArray *offScreenObstacles = nil;
    for(CCNode *obstacle in _obstacles)
    {
        CGPoint obstacleWorldPosition = [_physicsNode convertToWorldSpace:obstacle.position];
        CGPoint obstacleScreenPosition = [self convertToNodeSpace:obstacleWorldPosition];
        if(obstacleScreenPosition.x < -obstacle.contentSize.width)
        {
            if(!offScreenObstacles)
            {
                offScreenObstacles = [NSMutableArray array];
            }
            [offScreenObstacles addObject:obstacle];
        }
    }
    for(CCNode *obstacleToRemove in offScreenObstacles)
    {
        [obstacleToRemove removeFromParent];
        [_obstacles removeObject:obstacleToRemove];
        [self spawnNewObstical];
    }
    CGPoint heroWorldPosition = [_physicsNode convertToWorldSpace:_hero.position];
    CGPoint heroScreenPosition = [self convertToNodeSpace:heroWorldPosition];
    if(heroScreenPosition.x < -_hero.contentSize.width)
    {
        CCScene *gameOverScene = [CCBReader loadAsScene:@"GameOver"];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    if(_hero.position.y <= 125)
    {
        [_hero.physicsBody applyImpulse:ccp(0, 600.f)];
        [soundEffects playEffect:@"jump_01.wav"];
    } else if(_hero.position.y < 145)
    {
        [_hero.physicsBody applyImpulse:ccp(0, 150.f)];
        [soundEffects playEffect:@"jump_01.wav"];
    }
}

-(void)didLoadFromCCB {
    _grounds = @[_ground1, _ground2];
    _physicsNode.collisionDelegate = self;
    soundEffects = [OALSimpleAudio sharedInstance];
    [soundEffects preloadEffect:@"whoosh1.wav"];
    [soundEffects preloadEffect:@"hmm.wav"];
    [soundEffects preloadEffect:@"jump_01.wav"];
    [soundEffects preloadEffect:@"weapon_blow.wav"];
    self.userInteractionEnabled = TRUE;
    _obstacles = [NSMutableArray array];
    [self spawnNewObstical];
    [self spawnNewObstical];
    [self spawnNewObstical];
    [self spawnNewObstical];
    [self spawnNewObstical];
}

-(void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair Hero:(CCNode *)nodeA Axe:(CCNode *)nodeB
{
    [soundEffects playEffect:@"whoosh1.wav"];
}

-(void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair Hero:(CCNode *)nodeA Goblin:(CCNode *)nodeB
{
    if(_hero.position.y < 140){
        [soundEffects playEffect:@"weapon_blow.wav"];
        CCScene *gameOverScene = [CCBReader loadAsScene:@"GameOver"];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
    } else {
        [_hero.physicsBody applyImpulse:ccp(15.f, 80.f)];
    }
}

-(void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair Hero:(CCNode *)nodeA Box:(CCNode *)nodeB
{
    [soundEffects playEffect:@"weapon_blow.wav"];
}



@end
