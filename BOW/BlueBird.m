//
//  BlueBird.m
//  Birds
//
//  Created by Youngrok Lee on 10. 9. 5..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BlueBird.h"
@implementation BlueBird

- (id)init
{
	self=[super init];
    
	if (self != nil) {
        
        //BlueBird의 HP를 2 로 정한다.
        HP = 2;
        damage = 10;
        point  = 100;
        
        //5가지 애니메이션을 구성합니다.
        NSAutoreleasePool *pool =[[NSAutoreleasePool alloc] init];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bluebird.plist"];
		NSMutableArray *flyFrames = [NSMutableArray array];
        for(NSInteger idx = 1; idx < 17; idx++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"blue_fly%04d.png",idx]];
            [flyFrames addObject:frame];
        }
		CCAnimation *flyAnimation = [CCAnimation animationWithSpriteFrames:flyFrames delay:0.05f];
        flyAnimate = [[CCAnimate alloc] initWithAnimation:flyAnimation];
        
		NSMutableArray *sitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <61; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"blue_sit_%04d.png",idx]];
            [sitFrames addObject:frame];
        }
		CCAnimation *sitAnimation = [CCAnimation animationWithSpriteFrames:sitFrames delay:0.05f];
		sitAnimate = [[CCAnimate alloc] initWithAnimation:sitAnimation];
		
		NSMutableArray *tailFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <16; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"blue_tail_%04d.png",idx]];
            [tailFrames addObject:frame];
        }
		CCAnimation *tailAnimation = [CCAnimation animationWithSpriteFrames:tailFrames delay:0.05f];
		tailAnimate = [[CCAnimate alloc] initWithAnimation:tailAnimation];
        
        NSMutableArray *flyhitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <6; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"blue_flyhit_%04d.png",idx]];
            [flyhitFrames addObject:frame];
        }
		CCAnimation *flyHitAnimation = [CCAnimation animationWithSpriteFrames:flyhitFrames delay:0.05f];
		flyHitAnimate = [[CCAnimate alloc] initWithAnimation:flyHitAnimation];
		
        //파랑새가 총에 맞았을 때(한 번에 죽지않은 경우)보여주는 애니메이션을 정의합니다.
		NSMutableArray *hitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <6; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"blue_sit-hit_%04d.png",idx]];
            [hitFrames addObject:frame];
        }
		CCAnimation *aniHit = [CCAnimation animationWithSpriteFrames:hitFrames delay:0.05f];
		sitHitAnimate = [[CCAnimate alloc] initWithAnimation:aniHit];
        [pool release];
		
    }
	return self;
}

@end
