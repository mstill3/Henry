//
//  TitleScene.m
//  Henry
//
//  Created by iD Student on 6/30/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "TitleScene.h"
#import "GameScene.h"

int const MIN_CLOUD_DEPTH = 1; //close fast
int const MAX_CLOUD_DEPTH = 100; //far slow

//enum

@implementation TitleScene 
{
    
UITextField *passwordTextField;
    SKLabelNode *button;
    SKSpriteNode *mrGoose;
    int gooseX;
    NSString *name;
    BOOL isTouchRight, isEnding;
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        name = @"Henry";
        
        gooseX = self.frame.size.width/2;
        isTouchRight = YES;
        
        self.backgroundColor = [SKColor colorWithRed:(135.0/255.0) green:(206.0/255.0) blue:(250.0/255.0) alpha:1.0];
        
        [self setGrass];
        [self setLabels];
        [self addButton];
        [self addGoose];
        
    }
    return self;
}

-(void) addGoose{
            mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"honk"];
    
    mrGoose.size = CGSizeMake(100, 125);
    
    mrGoose.position = CGPointMake(0, 70); //self.frame.size.width/2, 70);

    [self addChild:mrGoose];
    
}

-(void) setGrass{
    CGSize c = CGSizeMake(self.frame.size.width, (self.frame.size.height*(1/15.0)));

//    SKSpriteNode *grass =  [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:c];
    SKSpriteNode *grass = [SKSpriteNode spriteNodeWithImageNamed:@"grass.jpg"];
    
    grass.size = c;
    
    grass.position = CGPointMake(grass.size.width/2, grass.size.height/2);

     [self addChild:grass];
    
//    [self addChild:grass];
    
}

-(void) setLabels{
    SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    SKLabelNode *title2Label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    SKLabelNode *aLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    titleLabel.text = @"HENRY";
    titleLabel.fontSize = 40;
    titleLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                      CGRectGetMidY(self.frame) + 40);
    
    title2Label.text = @"The Goose Chronicles";
    title2Label.fontSize = 10;
    title2Label.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame) + 10);
    
    aLabel.text = @"Matt Stillwell";
    aLabel.fontSize = 10;
    aLabel.position = CGPointMake(self.frame.size.width - 40, 10);
    aLabel.zPosition = 1;
    
    [self addChild:titleLabel];
    [self addChild:title2Label];
    [self addChild:aLabel];
}


-(void) addButton{
    button = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    button.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 80);
    button.text = @"Start";
//    button.zPosition = 100;
    button.name = @"Go";

    [self addChild:button];
}

-(void) didMoveToView:(SKView *)view{
    
//    UITextField txt = [];
    CGRect passwordTextFieldFrame = CGRectMake(self.frame.size.width/2 - 140, self.frame.size.height/2, 280.0f, 31.0f);
    passwordTextField= [[UITextField alloc] initWithFrame:passwordTextFieldFrame];
    passwordTextField.placeholder = @"Username";
    passwordTextField.backgroundColor = [UIColor whiteColor];
    passwordTextField.textColor = [UIColor blackColor];
    passwordTextField.font = [UIFont systemFontOfSize:14.0f];
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.returnKeyType = UIReturnKeyDone;
    passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passwordTextField.tag = 2;
    passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    [passwordTextField setDelegate:self];
    
    [self.view addSubview:passwordTextField];
    
}



-(void)cloudCreator{
    
    int depth = (int)MIN_CLOUD_DEPTH + arc4random_uniform(MAX_CLOUD_DEPTH - MIN_CLOUD_DEPTH);       //(int)MIN_CLOUD_DEPTH + arc4random() % (MAX_CLOUD_DEPTH);
    NSLog(@"%d", depth);

    int size = (MAX_CLOUD_DEPTH + 50) - depth;
    
//    int y = arc4random() % ((int)self.frame.size.height);    //0 to height
    int y = (self.frame.size.height/3) + arc4random_uniform(self.frame.size.height);
    
    SKSpriteNode *cloud = [SKSpriteNode spriteNodeWithImageNamed:@"cloud"];
    
    cloud.size = CGSizeMake(size, size); //80
    cloud.zPosition = 1/depth;
    
    int x = self.frame.size.width + cloud.size.width/2;
    cloud.position = CGPointMake(x, y);
    
    SKAction *action = [SKAction moveToX:(-100) duration:depth];
    [cloud runAction:action];
    
    
    [self addChild:cloud];
    
}

-(void) update:(NSTimeInterval)currentTime{
     /* Called before each frame is rendered */
    
    int r = (int)0 + arc4random_uniform(120 - 0);
    
    if(r == 60){
    [self cloudCreator];
    }
    
    if(isEnding){
                    passwordTextField.alpha = passwordTextField.alpha - .02;
    }
    
    if((int)mrGoose.position.x != gooseX){
        NSLog(@"%f: %d", mrGoose.position.x, gooseX);
        if (isTouchRight && mrGoose.position.x > gooseX-3) {
            mrGoose.position = CGPointMake(gooseX, mrGoose.position.y);
        } else if (isTouchRight){
            mrGoose.position = CGPointMake(mrGoose.position.x+3, mrGoose.position.y);
        } else if (!isTouchRight && mrGoose.position.x < gooseX+3) {
            mrGoose.position = CGPointMake(gooseX, mrGoose.position.y);
        } else if (!isTouchRight) {
            mrGoose.position = CGPointMake(mrGoose.position.x-3, mrGoose.position.y);
        }
        
    }
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [passwordTextField resignFirstResponder];
    return YES;
    
}

-(void) willMoveFromView:(SKView *)view{
    
    [passwordTextField removeFromSuperview];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"Go"]){
            SKAction *fade  = [SKAction rotateByAngle:M_PI*2 duration:1];
            [button runAction:fade];
            
            if([passwordTextField.text  isEqual: @""]){
                
            }else{
                name = passwordTextField.text;
            }
            
            NSLog(@"%@", name);
            
            SKTransition *reveal = [SKTransition fadeWithDuration:4];
            CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.height);
            GameScene *newScene = [[GameScene alloc] initWithSize:size SecondParameterName:name];  //SecondParameterName optional, if on one on all.  //method name = parameter 1
            
            reveal.pausesOutgoingScene = NO;
            
            isEnding = true;
            
            [self.scene.view presentScene:newScene transition:reveal];
 
            
        }else{
            
            
            //mrGoose.position = location;
            
            gooseX = (int)location.x;
            
            
            
            if(gooseX >= mrGoose.position.x){
                isTouchRight = YES;
                //            mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"honk"];
            }else{
                isTouchRight = NO;
                //            mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"honkback"];
            }
            
            
            //        SKAction *action = [SKAction moveToX:location.x duration:1];
            
            //        [mrGoose runAction:[SKAction repeatActionForever:action]];
            
        }
    }
}


@end
