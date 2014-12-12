#import "MainScene.h"
#import "Level.h"

@implementation MainScene

-(void)playBtn:(id)sender
{
    CCScene *levelScene = [CCBReader loadAsScene:@"Level"];
    [[CCDirector sharedDirector] replaceScene:levelScene];
}

@end
