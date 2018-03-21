//
//  EndScene.m
//  Henry
//
//  Created by iD Student on 6/30/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "EndScene.h"
#import "TitleScene.h"

@implementation EndScene{
    NSString *userName;
    BOOL result;
    SKLabelNode *button;
}

-(id)initWithSize:(CGSize)s SecondParameterName:(NSString*)playerName ThirdParameterName:(BOOL)sunglass{
    if (self = [super initWithSize:s]) {
        
        SKSpriteNode *mrGoose;
        mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"honk"];
        
        mrGoose.size = CGSizeMake(100, 125);
        
        mrGoose.position = CGPointMake(0, 70); //self.frame.size.width/2, 70);
        
        [self addChild:mrGoose];

        
                /* Setup your scene here */
        
        [self addButton];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        userName = playerName;

        result = sunglass;
        
        if(result){
            self.backgroundColor = [SKColor colorWithRed:0.3 green:0.1 blue:0.6 alpha:1.0];
                    myLabel.text = @"YOU WIN!!!!!!!!!!";
        }else{
                self.backgroundColor = [SKColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:1.0];
                    myLabel.text = @"YOU DIED!!!!!!!!!!";
            
            
        }
        
        [self addChild:myLabel];
    }
    return self;
}

-(void) addButton{
    button = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    button.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 80);
    button.text = @"Replay";
    //    button.zPosition = 100;
    button.name = @"Go";
    
    [self addChild:button];
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"Go"]){
            SKTransition *reveal = [SKTransition fadeWithDuration:1];
            CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.height);
            TitleScene *newScene = [[TitleScene alloc] initWithSize:size];  //SecondParameterName optional, if on one on all.  //method name = parameter 1
            [self.scene.view presentScene:newScene transition:reveal];
        }
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
