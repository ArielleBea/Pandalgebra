//
//  PauseMenu.m
//  TeamTwoBeta
//
//  Created by jarthur on 4/18/13.
//
//

#import "PauseMenu.h"
#import "MainMenu.h"

@implementation PauseMenu

-(id) init
{
	if(self = [super init]){
        
        // Ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Create Menu Background
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.position = ccp( size.width/2 , size.height/2 );
        [self addChild:background];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Paused" fontName:@"Marker Felt" fontSize:60];
        //label.position = ccp(size.width/2, size.height/2 + 100);
        label.position = ccp(512, 512);
        
        [self addChild:label];
        
        [CCMenuItemFont setFontName:@"Marker Felt"];
        [CCMenuItemFont setFontSize:35];
        
        CCMenuItem *resume = [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(resume:)];
        
        CCMenuItem *mainMenu = [CCMenuItemFont itemWithString:@"Main Menu" target:self selector:@selector(GoToMainMenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems: resume, mainMenu, nil];
        
		[menu alignItemsVerticallyWithPadding:20];
		//[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
        [menu setPosition:ccp(512, 412)];
        
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
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu node]]];
}

+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	PauseMenu *layer = [PauseMenu node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}
@end