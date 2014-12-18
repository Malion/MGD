//
//  Credits.m
//  MGDProject
//
//  Created by Jesse James on 12/17/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Credits.h"
#import "MainScene.h"

@implementation Credits

-(void)mainMenuBtn:(id)sender
{
    CCScene *mainMenu = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainMenu];
}

@end
