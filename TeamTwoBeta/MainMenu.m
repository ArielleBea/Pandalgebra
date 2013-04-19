//
//  MainMenu.m
//  TeamTwoBeta
//
//  Created by Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker on 4/7/13.
//  Copyright Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker 2013. All rights reserved.
//

// Background image used for noncommericial use as allowed by Mike Lowe. Original image found at following link
// http://www.flickr.com/photos/mikelowe/17520932/sizes/l/


#import "MainMenu.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

@implementation MainMenu
-(id)init
{
    if (self = [super init]) {
        
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Create Menu Background
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.position = ccp( size.width/2 + 128, size.height/2 - 128);
        [self addChild:background];
        
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"PANDALGEBRA" fontName:@"Marker Felt" fontSize:64];
        title.position = ccp(size.width /2  + 125, size.height/2);
        [self addChild:title];
        
        
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// Menu items for playing the game and exiting the game
		CCMenuItem *playGame = [CCMenuItemFont itemWithString:@"Play Game" block:^(id sender) {
			
			[[CCDirector sharedDirector] replaceScene:[MainController node]];
		}];
        
        CCMenuItem *quit = [CCMenuItemFont itemWithString:@"Quit" block:^(id sender) {

			exit(0);
		}];

		CCMenu *menu = [CCMenu menuWithItems:playGame, quit, nil];
		
		[menu alignItemsVerticallyWithPadding:20];
		[menu setPosition:ccp( size.width/2 + 125, size.height/2 - 100)];
        

		
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
