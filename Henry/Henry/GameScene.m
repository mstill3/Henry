//

//  GameScene.m

//  Henry

//

//  Created by iD Student on 6/30/14.

//  Copyright (c) 2014 matt. All rights reserved.

//


#import "TitleScene.h"
#import "GameScene.h"
#import "EndScene.h"






typedef enum {
    
    back,
    
    still,
    
    forward,
    
    jump
    
} WalkingState;




@implementation GameScene

{
    
    
    
    SKLabelNode *button;
    
    WalkingState gooseState;
    
    NSArray *_gooseWalkingFrames;
    
    NSMutableArray *walkFrames;
    
    NSMutableArray *backWalkFrames;
    
    SKTextureAtlas *gooseAnimatedAtlas;
    
    SKTextureAtlas *backGooseAnimatedAtlas;
    
    SKSpriteNode *mrGoose, *mrFox, *mrFish;
    
    NSString *userName;
    
    int gooseX, gooseY;
    
    BOOL isTouchRight, isTouchUp, oneWorking;
    
    int level, lives, numFish;
    
    SKSpriteNode *hold1, *hold2;
    
    SKLabelNode *livesLabel, *levelLabel;
    
    SKEmitterNode *ff, *snow;
    
    
    
}



-(id)initWithSize:(CGSize)s SecondParameterName:(NSString*)playerName{
    
    if (self = [super initWithSize:s]) {
        
        
        
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"FIREFLIES" ofType:@"sks"];
        
        ff = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        ff.position = CGPointMake(self.size.width/2, self.size.height/2);
        
        ff.targetNode = self.scene;
        
        ff.zPosition = -5;
        
        [self addChild:ff];
        
        
        
        
        lives = 3;
        
        numFish = 0;
        
        
        
        userName = playerName;
        
        
        
        CGSize c = CGSizeMake(self.frame.size.width, 20);
        
        hold1 = [SKSpriteNode spriteNodeWithImageNamed:@"hold.jpg"];
        
        
        
        hold1.size = c;
        
        
        
        hold1.position = CGPointMake(-100, -100);
        
        
        
        hold1.name = @"platform";
        
        
        
        [self addChild:hold1];
        
        
        
        c = CGSizeMake(self.frame.size.width, 20);
        
        hold2 = [SKSpriteNode spriteNodeWithImageNamed:@"hold.jpg"];
        
        
        
        hold2.size = c;
        
        
        
        hold2.position = CGPointMake(-100, -100);
        
        
        
        hold2.name = @"platform";
        
        
        
        [self addChild:hold2];
        
        
        
        
        
        NSLog(@"GOOOOOOOOOSe");
        
        
        
        level = 1;
        
        
        
        [self setGrass];
        
        [self setLabels];
        
        
        
        oneWorking = false;
        
        isTouchUp = NO;
        
        isTouchRight = YES;
        
        gooseState = still;
        
        gooseX = 0;
        
        
        
        mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"goose1"];   //////////////////////////////////////////////
        
        
        
        mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"goose1.png"];
        
        mrGoose.size = CGSizeMake(100, 125);
        
        mrGoose.position = CGPointMake(50, 70); //self.frame.size.width/2, 70);
        
        [self addChild:mrGoose];
        
        
        
        
        
        mrFish = [SKSpriteNode spriteNodeWithImageNamed:@"fish"];   //////////////////////////////////////////////
        
        
        
        mrFish = [SKSpriteNode spriteNodeWithImageNamed:@"fish.png"];
        
        mrFish.name = @"fish";
        
        mrFish.size = CGSizeMake(75, 50);
        
        mrFish.position = CGPointMake(300, 350); //self.frame.size.width/2, 70);
        
        [self addChild:mrFish];
        
        
        
        
        
        //        mrFox = [SKSpriteNode spriteNodeWithImageNamed:@"fox"];   //////////////////////////////////////////////
        
        
        
        mrFox = [SKSpriteNode spriteNodeWithImageNamed:@"foxbad.png"];
        
        mrFox.size = CGSizeMake(175, 125);
        
        mrFox.position = CGPointMake(300, 70); //self.frame.size.width/2, 70);
        
        mrFox.name = @"fox";
        
        [self addChild:mrFox];
        
        
        
        
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        
        
        
        
    }
    
    return self;
    
}

-(void) addButton{
    button = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    button.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 80);
    button.text = @"Start";
    //    button.zPosition = 100;
    button.name = @"Go";
    
    [self addChild:button];
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





-(void) level1{
    
    
    
    
    
    hold1.position = CGPointMake(-100, self.frame.size.height/2 - 80);
    
    hold2.position = CGPointMake(400, self.frame.size.height/2 + 80);
    
    
}



-(void) level2{
    
    
    
    self.backgroundColor = [SKColor colorWithRed:0.5 green:0.15 blue:0.3 alpha:1.0];
    
    
    CGSize c = CGSizeMake(50, 20);
    
    hold1.size = c;
    hold1.position = CGPointMake(0, 180);
    
    hold2.size = c;
    hold2.position = CGPointMake(300, 300);
    
    
    
//    mrFox.position = CGPointMake(400, self.frame.size.height/2 + 80);
    
    
    
    
    //    if(){
    
    
    
    //    }
    
    
    
}





-(void) level3{
    
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.3 blue:0.3 alpha:1.0];
    
            CGSize c = CGSizeMake(self.frame.size.width, 20);
    
//    hold1.size = c;
    
//    hold1.position = CGPointMake(-100, self.frame.size.height/2 - 80);
    
    [hold1 removeFromParent];
    
    hold2.size = c;
    
    hold2.position = CGPointMake(420, self.frame.size.height/2 + 20);
    
    
    
    //    if(){
    
    
    
    //    }
    
    
    
}





-(void) reset{
    mrGoose.position = CGPointMake(50, 70); //self.frame.size.width/2, 70);
           gooseX = 30;
            gooseY = 70;
}

//
//    if(which == 1){

//

////        hold1.size = CGSizeMake(30, 20);

////        hold2.size = CGSizeMake(30, 20);

//

////        mrGoose.size = CGSizeMake(100, 125);

////        mrGoose.position = CGPointMake(50, 70); //self.frame.size.width/2, 70);

//

////        mrFish.size = CGSizeMake(75, 50);

//        mrFish.position = CGPointMake(300, 350); //self.frame.size.width/2, 70);

//

////        mrFox.size = CGSizeMake(175, 125);

//        mrFox.position = CGPointMake(300, 70); //self.frame.size.width/2, 70);

//

//

//        mrGoose.position = CGPointMake(0, 70); //self.frame.size.width/2, 70);

//

//        gooseX = 30;

//        gooseY = 70;

//

//        hold1.position = CGPointMake(30, self.frame.size.height/2 - 80);

//        hold2.position = CGPointMake(200, self.frame.size.height/2 + 80);

//

//    }else if(which == 2){

//

//        hold1.size = CGSizeMake(30, 20);

//        hold2.size = CGSizeMake(30, 20);

//

//        mrFox.position = CGPointMake(250, 70);

//        mrFish.position = CGPointMake(100, 350);

//        mrGoose.position = CGPointMake(0, 70); //self.frame.size.width/2, 70);

//

//        hold1.position = CGPointMake(20, self.frame.size.height/2 - 80);

//        hold2.position = CGPointMake(400, self.frame.size.height/2 + 80);

//

//        gooseX = 30;

//        gooseY = 70;

//

//    }else{

//

//        mrGoose.position = CGPointMake(0, 70); //self.frame.size.width/2, 70);

//

//        hold1.position = CGPointMake(20, self.frame.size.height/2 - 80);

//        hold2.position = CGPointMake(400, self.frame.size.height/2 + 80);

//

//        mrFox.position = CGPointMake(-100, self.frame.size.height/2 - 80);

//        hold2.position = CGPointMake(400, self.frame.size.height/2 + 80);

//

//        gooseX = 30;

//        gooseY = 70;

//

//    }

//

//

//    //    if(){

//

//    //    }

//

//}





-(void) setLabels{
    
    
    
    levelLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    
    
    levelLabel.text = [NSString stringWithFormat:@"Level %d", level];
    
    levelLabel.zPosition = -1;
    
    levelLabel.fontSize = 30;
    
    levelLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                      
                                      CGRectGetMidY(self.frame));
    
    
    
    [self addChild:levelLabel];
    
    
    
    SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    
    
    titleLabel.text = userName; //playerName;
    
    titleLabel.fontSize = 20;
    
    titleLabel.position = CGPointMake(50, 450);
    
    
    
    [self addChild:titleLabel];
    
    
    
    livesLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    
    
    livesLabel.text = [NSString stringWithFormat:@"X %d", lives]; //playerName;
    
    livesLabel.fontSize = 20;
    
    livesLabel.position = CGPointMake(40, 425);
    
    
    
    [self addChild:livesLabel];
    
    
    
}



-(void)forwardGoose{
    
    
    
    walkFrames = [NSMutableArray array];
    
    gooseAnimatedAtlas = [SKTextureAtlas atlasNamed:@"GooseImages"];
    
    
    
    
    
    int numImages = gooseAnimatedAtlas.textureNames.count;
    
    for (int i=1; i <= numImages; i++) {
        
        NSString *textureName = [NSString stringWithFormat:@"goose%d", i];
        
        SKTexture *temp = [gooseAnimatedAtlas textureNamed:textureName];
        
        [walkFrames addObject:temp];
        
    }
    
    _gooseWalkingFrames = walkFrames;
    
    
    
    SKTexture *temp = _gooseWalkingFrames[0];
    
    mrGoose = [SKSpriteNode spriteNodeWithTexture:temp];
    
    
    
    //This is our general runAction method to make our bear walk.
    
    [mrGoose runAction:[SKAction repeatActionForever:
                        
                        [SKAction animateWithTextures:_gooseWalkingFrames
                         
                                         timePerFrame:0.1f
                         
                                               resize:NO
                         
                                              restore:YES]] withKey:@"walkingInPlaceGoose"];
    
    
    
    
    
}



-(void)backGoose{  ////
    
    
    
    walkFrames = [NSMutableArray array];
    
    gooseAnimatedAtlas = [SKTextureAtlas atlasNamed:@"GooseImages"];
    
    
    
    
    
    int numImages = gooseAnimatedAtlas.textureNames.count;
    
    for (int i=1; i <= numImages; i++) {
        
        NSString *textureName = [NSString stringWithFormat:@"goose%d", i];
        
        SKTexture *temp = [gooseAnimatedAtlas textureNamed:textureName];
        
        [walkFrames addObject:temp];
        
    }
    
    _gooseWalkingFrames = walkFrames;
    
    
    
    SKTexture *temp = _gooseWalkingFrames[0];
    
    mrGoose = [SKSpriteNode spriteNodeWithTexture:temp];
    
    
    
    //This is our general runAction method to make our goose walk.
    
    [mrGoose runAction:[SKAction repeatActionForever:
                        
                        [SKAction animateWithTextures:_gooseWalkingFrames
                         
                                         timePerFrame:0.1f
                         
                                               resize:NO
                         
                                              restore:YES]] withKey:@"walkingInPlaceGoose"];
    
    
    
    
    
}



-(void)jumpGoose{  ////
    
    
    
    walkFrames = [NSMutableArray array];
    
    gooseAnimatedAtlas = [SKTextureAtlas atlasNamed:@"GooseImages"];
    
    
    
    
    
    int numImages = gooseAnimatedAtlas.textureNames.count;
    
    for (int i=1; i <= numImages; i++) {
        
        NSString *textureName = [NSString stringWithFormat:@"goose%d", i];
        
        SKTexture *temp = [gooseAnimatedAtlas textureNamed:textureName];
        
        [walkFrames addObject:temp];
        
    }
    
    _gooseWalkingFrames = walkFrames;
    
    
    
    SKTexture *temp = _gooseWalkingFrames[0];
    
    mrGoose = [SKSpriteNode spriteNodeWithTexture:temp];
    
    
    
    //This is our general runAction method to make our goose walk.
    
    [mrGoose runAction:[SKAction repeatActionForever:
                        
                        [SKAction animateWithTextures:_gooseWalkingFrames
                         
                                         timePerFrame:0.1f
                         
                                               resize:NO
                         
                                              restore:YES]] withKey:@"walkingInPlaceGoose"];
    
    
    
    
    
}







-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    
    /* Called when a touch begins */
    
    
    
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        //        SKNode *node = [self nodeAtPoint:location];
        
        //mrGoose.position = location;
        
        
        
        gooseX = location.x;
        
        gooseY = location.y;
        
        
        
        
        
        
        
        if(gooseX >= mrGoose.position.x && 200 > mrGoose.position.y){
            
            isTouchRight = YES;
            
            //            mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"honk"];
            
        }else if(gooseX < mrGoose.position.x && 200 > mrGoose.position.y){
            
            isTouchRight = NO;
            
            //            mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"honkback"];
            
        }
        
        
        
        if(gooseY >= mrGoose.position.y){
            
            isTouchUp = YES;
            
        }
        
        
        
        
        
        //        SKAction *action = [SKAction moveToX:location.x duration:1];
        
        
        
        //        [mrGoose runAction:[SKAction repeatActionForever:action]];
        
        
        
    }
    
    
    
    
    
}



-(void) checkJump{
    
    
    
    if(isTouchUp && mrGoose.position.y <= self.frame.size.height/2 && !oneWorking){
        
        mrGoose.position = CGPointMake(mrGoose.position.x, mrGoose.position.y+200);
        
        NSLog(@"jumped");
        
        gooseState = jump;
        
        oneWorking = YES;
        
        //
        
        //        mrGoose.position = CGPointMake(mrGoose.position.x, mrGoose.position.y-3);
        
        //        gooseState = jump;
        
        
        
    }
    
    
    
    if(mrGoose.position.y >= 200){
        
        isTouchUp = NO;
        
    }
    
    
    
    if(mrGoose.position.y <= 70){
        
        oneWorking = NO;
        
        isTouchUp = NO;
        
        //        gooseY = 0;
        
    }
    
    
    
}



-(void) checkCollision

{
    
    // access collidable objects
    
    [self enumerateChildNodesWithName:@"platform" usingBlock:^(SKNode *node, BOOL *stop) {
        
        // check collision with goose
        
        if (CGRectIntersectsRect(node.frame, mrGoose.frame)) {
            
            // do stuff
            
            mrGoose.position = CGPointMake(mrGoose.position.x, mrGoose.position.y+1);
            
            oneWorking = NO;
            
        }
        
    }];
    
    
    
    [self enumerateChildNodesWithName:@"fish" usingBlock:^(SKNode *node, BOOL *stop) {
        
        // check collision with goose
        
        if (CGRectIntersectsRect(node.frame, mrGoose.frame)) {
            
            // do stuff
            
            level++;
            
            levelLabel.text = [NSString stringWithFormat:@"Level %d", level];
            
            numFish++;
            
            mrGoose.position = CGPointMake(0, 70); //self.frame.size.width/2, 70);
            
            //            [self reset : level];/
            
        }
        
    }];
    
    
    
    [self enumerateChildNodesWithName:@"fox" usingBlock:^(SKNode *node, BOOL *stop) {
        
        // check collision with goose
        
        if (CGRectIntersectsRect(node.frame, mrGoose.frame)) {
            
            // do stuff
            
//            if(lives - 1 >= 0){
            
                lives--;
            [self reset];
                
//            }
            
            livesLabel.text = [NSString stringWithFormat:@"X %d", lives]; //playerName;
            
            //            [self reset : level];
            
        }
        
    }];
    
    
    
}



-(void) checkLeft{
    
    
    
    if (!isTouchRight) {
        
        mrGoose.position = CGPointMake(mrGoose.position.x-3, mrGoose.position.y);
        
        gooseState = back;
        
    }
    
    
    
    
    
}



-(void) checkRight{
    
    
    
    if (isTouchRight){
        
        mrGoose.position = CGPointMake(mrGoose.position.x+3, mrGoose.position.y);
        
        gooseState = forward;
        
    }
    
    
    
}



-(void) checkStill{
    
    
    
    if (isTouchRight && mrGoose.position.x > gooseX-3) {
        
        mrGoose.position = CGPointMake(gooseX, mrGoose.position.y);
        
        gooseState = still;
        
    } else if (!isTouchRight && mrGoose.position.x < gooseX+3) {
        
        mrGoose.position = CGPointMake(gooseX, mrGoose.position.y);
        
        gooseState = still;
        
    }
    
    
    
}

-(void)cloudCreator{
    
    int MIN_CLOUD_DEPTH = 1; //close fast
    int MAX_CLOUD_DEPTH = 100; //far slow
    
    int depth = (int)MIN_CLOUD_DEPTH + arc4random_uniform(MAX_CLOUD_DEPTH - MIN_CLOUD_DEPTH);       //(int)MIN_CLOUD_DEPTH + arc4random() % (MAX_CLOUD_DEPTH);
    NSLog(@"%d", depth);
    
    int size = (MAX_CLOUD_DEPTH + 50) - depth;
    
    //    int y = arc4random() % ((int)self.frame.size.height);    //0 to height
    int y = (self.frame.size.height/3) + arc4random_uniform(self.frame.size.height);
    
    SKSpriteNode *cloud = [SKSpriteNode spriteNodeWithImageNamed:@"cloud"];
    
    cloud.size = CGSizeMake(size, size); //80
    cloud.zPosition = -3;
    
    int x = self.frame.size.width + cloud.size.width/2;
    cloud.position = CGPointMake(x, y);
    
    SKAction *action = [SKAction moveToX:(-100) duration:depth];
    [cloud runAction:action];
    
    
    [self addChild:cloud];
    
}


-(void)update:(CFTimeInterval)currentTime {
    
    /* Called before each frame is rendered */
    
//    if(level == 1 || level == 3){
//    
//    int r = (int)0 + arc4random_uniform(360 - 0);
//    
//    if(r == 60){
//        [self cloudCreator];
//    }
//}


    
    
    if(lives == 0){
        
        [self end : NO];
        
        lives = -1;
        
        return;
        
    }
    
    
    
    if(numFish == 3){
        
        [self end : YES];
        
        numFish = 0;
        
        return;
        
    }
    
    
    
    
    
    if((int)mrGoose.position.x != gooseX){
        
        
        
        [self checkJump];
        
        [self checkStill];
        
        [self checkLeft];
        
        [self checkRight];
        
        
        
    }
    
    
    
    if(mrGoose.position.y > 70){
        
        mrGoose.position = CGPointMake(mrGoose.position.x, mrGoose.position.y-1);
        
    }
    
    
    
    [self checkCollision];
    
    
    
    if(level == 1){
        
        [self level1];
        
    } else if(level == 2){
        
        [self level2];
        
    } else if(level == 3){
        
        [self level3];
        
    }
    
    
    
    
    
    //    for(SKNode *node in self.children){
    
    //        node.position = CGPointMake(node.position.x-1, node.position.y);
    
    //    }
    
    //    
    
    //    mrGoose.position = CGPointMake(mrGoose.position.x+1, mrGoose.position.y);
    
    
    
    
    
    
    
    //    if(gooseY >= mrGoose.position.y + 10){
    
    //        isTouchUp = YES;
    
    //    }else{
    
    //        isTouchUp = NO;
    
    //        NSLog(@"hi");
    
    //    }
    
    
    
    
    
    //    switch (gooseState) {
    
    //        case still:
    
    //mrGoose = [SKSpriteNode spriteNodeWithImageNamed:@"goose1"];
    
    //            break;
    
    //        case forward:
    
    //            [self forwardGoose];
    
    //            break;
    
    //        case back:
    
    //            [self backGoose];
    
    //            break;
    
    //    
    
    //    }
    
}



-(void) end:(BOOL)result{
    
    SKTransition *reveal = [SKTransition fadeWithDuration:1];
    
    CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    
    EndScene *newScene = [[EndScene alloc] initWithSize:size SecondParameterName:userName ThirdParameterName:result];  //SecondParameterName optional, if on one on all.  //method name = parameter 1
    
    
    
    //    reveal.pausesOutgoingScene = NO;
    
    
    
    //    isEnding = true;
    
    
    
    [self.scene.view presentScene:newScene transition:reveal];
    
    NSLog(@"BYEEEEEEEEEEEEEE");
    
}



@end

