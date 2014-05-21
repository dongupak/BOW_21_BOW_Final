//
//  RedBird.m
//  BOW
//
//  Created by Yeongrok Lee on 11. 8. 24..
//  Copyright 2011년 Happy Potion. All rights reserved.
//

#import "RedBird.h"


@implementation RedBird
- (id)init {
    
	self=[super init];
    
	if (self != nil) {
        //RedBird의 체력,피해량,점수를 설정합니다.
        HP = 2;
        damage = 20;
        point  = 200;
        
        //5가지 애니메이션을 구성합니다.
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"redbird.plist"];
		NSMutableArray *flyFrames = [NSMutableArray array];
        for(NSInteger idx = 1; idx < 17; idx++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"red_fly%04d.png",idx]];
            [flyFrames addObject:frame];
        }
		CCAnimation *flyAnimation = [CCAnimation animationWithSpriteFrames:flyFrames delay:0.05f];
        flyAnimate = [[CCAnimate alloc] initWithAnimation:flyAnimation];
        
		NSMutableArray *sitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <31; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"red_sit%04d.png",idx]];
            [sitFrames addObject:frame];
        }
		CCAnimation *sitAnimation = [CCAnimation animationWithSpriteFrames:sitFrames delay:0.05f];
		sitAnimate = [[CCAnimate alloc] initWithAnimation:sitAnimation];
		
		NSMutableArray *tailFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <16; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"red_tail_%04d.png",idx]];
            [tailFrames addObject:frame];
        }
		CCAnimation *tailAnimation = [CCAnimation animationWithSpriteFrames:tailFrames delay:0.05f];
		tailAnimate = [[CCAnimate alloc] initWithAnimation:tailAnimation];
        
        NSMutableArray *flyhitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <10; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"red_flyhit%04d.png",idx]];
            [flyhitFrames addObject:frame];
        }
		CCAnimation *flyHitAnimation = [CCAnimation animationWithSpriteFrames:flyhitFrames delay:0.05f];
		flyHitAnimate = [[CCAnimate alloc] initWithAnimation:flyHitAnimation];
		
        //빨강새가 총에 맞았을 때(한 번에 죽지않은 경우)보여주는 애니메이션을 정의합니다.
		NSMutableArray *hitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <11; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"red_hit%04d.png",idx]];
            [hitFrames addObject:frame];
        }
		CCAnimation *aniHit = [CCAnimation animationWithSpriteFrames:hitFrames delay:0.05f];
		sitHitAnimate = [[CCAnimate alloc] initWithAnimation:aniHit];
        
    }
	return self;
}

@end
