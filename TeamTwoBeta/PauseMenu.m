//
//  PauseMenu.m
//  TeamTwoBeta
//
//  Created by jarthur on 4/18/13.
//
//

#import "PauseMenu.h"
#import "MainMenu.h"

@implementation PauseScene

-(id) init
{
	if(self = [super init]){
        
		CCLabelTTF* label = [CCLabelTTF labelWithString:@"Paused" fontName:@"MarkerFelt" fontSize:60];
        
        label.position = ccp(240, 160);
        
        [self addChild: label];
        
        [CCMenuItemFont setFontName:@"Marker Felt"];
        [CCMenuItemFont setFontSize:35];
        
        CCMenuItem *Resume = [CCMenuItemFont itemFromString:@"Resume" target:self selector:@selector(resume:)];
        
        CCMenuItem *Quit = [CCMenuItemFont itemFromString:@"Quit" target:self selector:@selector(GoToMainMenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems: Resume, Quit, nil];
        menu.position = ccp(240, 131.67f);
        
        [menu alignItemsVerticallyWithPadding:12.5f];
        
        [self addChild:menu];
    }
    return self;
}

-(void) resume: (id) sender {
    
    [[CCDirector sharedDirector] popScene];
}

-(void) GoToMainMenu: (id) sender {
    
    [[CCDirector sharedDirector] sendCleanupToScene];
    [[CCDirector sharedDirector] popScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu node]]
     ];
}

+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	PauseScene *layer = [PauseScene node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}
@end