//
//  ViewController.m
//  Henry
//
//  Created by iD Student on 6/30/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "ViewController.h"
#import "TitleScene.h"

@implementation ViewController{
        AVAudioPlayer *_player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_player prepareToPlay];
    [self music];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * scene = [TitleScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

-(void)music{
    
    [self soundSetter:@"Sun":@"mp3"];
    [_player play];
    
}

- (void)soundSetter:(NSString*)track :(NSString*)ext
{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:track ofType:ext];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    NSError *error;
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    //    _player.volume = 1.0;
    //    float amount = _volSlide.value;
    //    _player.volume = amount;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
