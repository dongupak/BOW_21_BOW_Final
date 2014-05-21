//
//  BirdsSprite.m
//  GameDemo
//
//  Created by Youngrok Lee on 10. 9. 5..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Bird.h"

@implementation Bird

//헤더파일(Bird.h)에서 프로퍼티로 선언했던 변수들의 setter와 getter를 자동으로 생성시켜 줍니다.
@synthesize flyAnimate;
@synthesize sitAnimate;
@synthesize tailAnimate;
@synthesize flyHitAnimate;
@synthesize sitHitAnimate;
@synthesize sitPoint;
@synthesize startPoint;
@synthesize isDead;
@synthesize delegate;
@synthesize HP;
@synthesize damage;
@synthesize point;

- (void)dealloc {
	if (flyAnimate != nil)	[self setFlyAnimate:nil];
	if (sitAnimate != nil)	[self setSitAnimate:nil];
	if (tailAnimate != nil)	[self setTailAnimate:nil];
    [super dealloc];
}

- (id)init {
	self=[super init];
	if (self != nil) {
        isSit = NO;
    }
	return self;
}

//새가 flyAnimate를 무한반복하게 하고 sitPoint로 이동하여 onLine이라는 메소드를 수행하도록 하는 메소드 onEnter 입니다.
- (void)onEnter{
    [super onEnter];
	id actionFly    = [CCRepeatForever actionWithAction:flyAnimate];
    id actionMove   = [CCMoveTo actionWithDuration:ccpDistance(self.position, sitPoint)/150 position:sitPoint];
    id moveComplete = [CCCallFunc actionWithTarget:self selector:@selector(onLine)];
    [self runAction:actionFly];
    [self runAction:[CCSequence actions:actionMove, moveComplete, nil]];
}

//Bird 가 죽지 않으면 damage를 인자로 하는 birdAttack 함수를 호출하는 메소드입니다.
- (void)onTimer {
	if(!isDead) [self.delegate birdAttack:self.damage];
}

//전선 위의 새가 모든 액션을 중지하고 sitAnimate를 수행하며 1초 간격으로 onTimer라는 메소드를 수행합니다.(스케쥴러 이용)
- (void)onLine {
    isSit = YES;
	id actionSit=[CCRepeatForever actionWithAction:sitAnimate];
    [self stopAllActions];
    [self runAction:actionSit];
    [self schedule:@selector(onTimer) interval:1.0f];
}
- (void)hit :(int) hp{
    HP -= hp;
    
    if (HP<=0) {
        [self die];
    } else {
        [self stopAllActions];
        //        if (isSit) {
        //            [self runAction:sitHitAnimate];
        //        } else {
        //            [self runAction:flyHitAnimate];
        //        }
        
        if (isSit) {
            id actionHitComplete = [CCCallFunc actionWithTarget:self
                                                       selector:@selector(sitHitComplete)];
            id sequence =  [CCSequence actions:sitHitAnimate, actionHitComplete, nil];
            [self runAction:sequence];
        } else {
            id actionHitComplete=[CCCallFunc actionWithTarget:self
                                                     selector:@selector(hitComplete)];
            id sequence = [CCSequence actions:flyHitAnimate, actionHitComplete, nil];
            [self runAction:sequence];
        }
    }
}

- (void)hit {
    //hit 함수가 호출되면 HP가 1 감소한다.
    HP -=1;
    
    //HP가 감소한 뒤 0 이면 die 함수를 호출한다.
    if (HP==0) {
        [self die];
    } else {
        [self stopAllActions];
        //        if (isSit) {
        //            [self runAction:sitHitAnimate];
        //        } else {
        //            [self runAction:flyHitAnimate];
        //        }
        
        if (isSit) {
            id actionHitComplete = [CCCallFunc actionWithTarget:self selector:@selector(sitHitComplete)];
            id sequence =  [CCSequence actions:sitHitAnimate, actionHitComplete, nil];
            [self runAction:sequence];
        } else {
            id actionHitComplete=[CCCallFunc actionWithTarget:self selector:@selector(hitComplete)];
            id sequence = [CCSequence actions:flyHitAnimate, actionHitComplete, nil];
            [self runAction:sequence];
        }
        
    }
}

//onEnter 메소드를 수행합니다.
- (void)hitComplete {
	[self onEnter];
}

//sitAnimate를 무한반복하는 액션을 수행하도록 하는 메소드입니다.
- (void)sitHitComplete {
	id actionSit=[CCRepeatForever actionWithAction:sitAnimate];
	[self runAction:actionSit];
}

// 변수 isDead를 YES로 정의하고, 모든 액션을 중지합니다.
//deadComplete 메소드를 호출하는 액션인 deadComplete를 정의하고 새가 tailAnimate와 deadComplete를 순차적으로 수행하도록 합니다.
- (void)die {
    //HP가 0이 되어 호출된 함수.
    isDead = YES;
    [self stopAllActions];
    //모든 액션을 멈추고
    //애니메이션과 함수호출을 차례로 시행한다.
    id deadComplete = [CCCallFunc actionWithTarget:self selector:@selector(deadComplete)];
    [self runAction:[CCSequence actions:tailAnimate, deadComplete, nil]];
}

- (void)deadComplete {
    //deadComplete 함수를 호출한다.
    [self.delegate deadComplete:self];
}

@end
