//
//  Difficulty.m
//  TeamTwoBeta
//
//  Created by Izzy Funke on 4/23/13.
//
//

#import "Difficulty.h"

@implementation Difficulty

- (id)init
{
    if ((self = [super init])) {
        
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Create Instructions Background
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.position = ccp( size.width/2, size.height/2);
        [self addChild:background];
        
        [CCMenuItemFont setFontSize:50];
        [CCMenuItemFont setFontName:@"Marker Felt"];
        
        CCMenuItem *easy = [CCMenuItemFont itemWithString:@"Easy" block:^(id sender) {
            globalVariables.difficultyLevel = 0;
			[[CCDirector sharedDirector] replaceScene:[MainController node]];
        }];
        
        CCMenuItem *hard = [CCMenuItemFont itemWithString:@"Hard" block:^(id sender) {
            globalVariables.difficultyLevel = 1;
			[[CCDirector sharedDirector] replaceScene:[MainController node]];
		}];
        
        CCMenuItem *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1
                                                                        scene:[MainMenu node]]];
		}];
        
        CCMenu *menu = [CCMenu menuWithItems: easy, hard, back, nil];
        menu.position = ccp(500, 400);
        
        [menu alignItemsVerticallyWithPadding:40];
        
        [self addChild:menu];
        
    }
    
    return self;
}


+ (id) difficultyScene
{
    CCScene * difficultyScene = [CCScene node];
    Difficulty * layer =  [Difficulty node];
    [difficultyScene addChild: layer];
    return difficultyScene;
}


@end
