//
//  MainMenu.h
//  TeamTwoBeta
//
//  Created by Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker on 4/7/13.
//  Copyright Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker 2013. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface HighScoreScene : CCLayer

-(void) GoToMainMenu: (id) sender;
+(id) scene;

@end