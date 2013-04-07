//
//  MainMenu.m
//  TeamTwoBeta
//
//  Created by Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker on 4/7/13.
//  Copyright Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker 2013. All rights reserved.
//

#import "MainMenu.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

@implementation MainMenu
-(id)init
{
    if (self = [super init]) {
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"PANDALGEBRA" fontName:@"Marker Felt" fontSize:64];
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        title.position = ccp(size.width /2  + 125, size.height/2);
        [self addChild:title];
        
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// Achievement Menu Item using blocks
		CCMenuItem *playGame = [CCMenuItemFont itemWithString:@"Play Game" block:^(id sender) {
			
			[[CCDirector sharedDirector] replaceScene:[MainController node]];
		}];
            
		CCMenu *menu = [CCMenu menuWithItems:playGame, nil];
		
		[menu alignItemsVerticallyWithPadding:20];
		[menu setPosition:ccp( size.width/2 + 125, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];

    }
    
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

+(id) menuScene
{
    CCScene *menuScene = [CCScene node];
    MainMenu *layer = [MainMenu node];
    [menuScene addChild:layer];
    return menuScene;
}

-(void) startGame
{
    
}

@end
