//
//  MainMenu.m
//  TeamTwoBeta
//
//  Created by Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker on 4/7/13.
//  Copyright Ari Schlesinger, Abby Gregory, Izzy Funke, and Miranda Parker 2013. All rights reserved.
//

// Background image used for noncommericial use as allowed by Mike Lowe. Original image found at following link
// http://www.flickr.com/photos/mikelowe/17520932/sizes/l/


#import "HighScoreMenu.h"
#import "MainMenu.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

int NUM_SCORES = 5;

@implementation HighScoreScene
@synthesize score = _score;

-(id)init
{
    if (self = [super init]) {
        
        // Ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Create menu nackground
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.position = ccp( size.width/2, size.height/2);
        [self addChild:background];
        
        // Create menu title
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"High Scores" fontName:@"Marker Felt" fontSize:64];
        title.position = ccp(512, 512);
        [self addChild:title];
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
        
        // Menu item for returning to the main menu
        CCMenuItem *quit = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(GoToMainMenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems:quit, nil];
        
        [menu alignItemsVerticallyWithPadding:700];
        [menu setPosition:ccp(512, 200)];
        
        // Add the menu to the layer
        [self addChild:menu];
        
        // Add score to list if appropriate
        NSString* userName = [self promptForName];
        //[self addScore: userName];
    }
    
    return self;
}

-(void) GoToMainMenu: (id) sender
{
    
    [[CCDirector sharedDirector] sendCleanupToScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu node]]];
}

-(void) addScore: (NSString*) userName
{
    // Get the user's information
    NSMutableString* userScore = [NSMutableString stringWithFormat:@"%d", _score];
    
    // Read in the scores
    NSString* path = [[NSBundle mainBundle] pathForResource:@"savedscores" ofType:@"txt"];
    
    NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray* scores = (NSMutableArray*)[fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    // Read in the names
    path = [[NSBundle mainBundle] pathForResource:@"savednames" ofType:@"txt"];
    
    fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding
                                                error:nil];
    NSMutableArray* names = (NSMutableArray*)[fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    int newHighScore = -1;
    for (int i = 0; i < NUM_SCORES; i++) {
        // Is this a score in the list that the user's score surpasses?
        if ([[scores objectAtIndex: i] intValue] <= _score) {
            // Store their place
            if (newHighScore == -1) {
                newHighScore = i;
                [scores insertObject:userScore atIndex:i];
                [scores removeLastObject];
                [names insertObject:userName atIndex:i];
                [names removeLastObject];
            }
            
        }
    }
    
    // The user achieved a high score, so prompt for their name.
    if (newHighScore != -1) {
        [names replaceObjectAtIndex:newHighScore withObject: userName];
    }
    
    // Make the menu using these scores and names
    [self writeNames: names andScores: scores];
}

-(NSString*) promptForName
{
    message = [[UIAlertView alloc] initWithTitle:@"What is your name?"
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"Cancel"
                                                otherButtonTitles:@"OK", nil];
        
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [message show];
    return [message textFieldAtIndex:0].text;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self addScore: [message textFieldAtIndex:0].text];
    }
    else {
        [self addScore: @"Anonymous"];
    }
}

-(void) writeNames: (NSMutableArray*) names andScores: (NSMutableArray*) scores
{
    for (int i = 0; i < [names count]; i++) {
        // Create the label
        CCLabelTTF *label = [CCLabelTTF labelWithString:[names objectAtIndex:i]
                                           dimensions:CGSizeMake(220, 30)
                                           hAlignment:UITextAlignmentLeft
                                           fontName:@"Marker Felt" fontSize:30];
        [label setColor:ccWHITE];
        [label setFontSize:30];
    
        // Position it on the screen
        label.position = ccp(400,450-30*i);
    
        // Add it to the scene so it can be displayed
        [self addChild:label];
    }
    
    for (int i = 0; i < [scores count]; i++) {
        // Create the label
        CCLabelTTF *label = [CCLabelTTF labelWithString:[scores objectAtIndex:i]
                                             dimensions:CGSizeMake(220, 30)
                                             hAlignment:UITextAlignmentRight
                                             fontName:@"Marker Felt" fontSize:30];
        [label setColor:ccWHITE];
        [label setFontSize:30];
        
        // Position it on the screen
        label.position = ccp(620,450-30*i);
        
        // Add it to the scene so it can be displayed
        [self addChild:label];
    }
}

-(void) dealloc
{
    [super dealloc];
}

+(id) scene
{
    CCScene *highScoreScene = [CCScene node];
    HighScoreScene *layer = [HighScoreScene node];
    [highScoreScene addChild:layer];
    return highScoreScene;
}

@end