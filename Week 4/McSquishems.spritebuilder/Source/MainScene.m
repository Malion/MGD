#import "MainScene.h"
#import "Level.h"
#import "Credits.h"
#import "Instructions.h"

@implementation MainScene

-(void)playBtn:(id)sender
{
    CCScene *levelScene = [CCBReader loadAsScene:@"Level"];
    [[CCDirector sharedDirector] replaceScene:levelScene];
}

-(void)creditsBtn:(id)sender
{
    CCScene *creditScene = [CCBReader loadAsScene:@"Credits"];
    [[CCDirector sharedDirector] replaceScene:creditScene];
}

-(void)instructionsBtn:(id)sender
{
    CCScene *instructionsScene = [CCBReader loadAsScene:@"Instructions"];
    [[CCDirector sharedDirector] replaceScene:instructionsScene];
}

@end
