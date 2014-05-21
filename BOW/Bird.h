//
//  Bird.h
//  GameDemo
//
//  Created by Youngrok Lee on 10. 9. 5..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"
#import "cocos2d.h"

@protocol BirdDelegate;

@interface Bird : CCSprite {
    // 아래의 변수들을 전역변수로 지정합니다.
    BOOL isDead;
    BOOL isSit; //새가 전선 위에 앉아있는 지 없는 지를 나타내는 변수 isSit을 전역변수로 선언합니다.
    int HP;
    int damage;
    int point;
    
    CGPoint startPoint;
	CGPoint sitPoint;
	CCAnimate *flyAnimate;
	CCAnimate *sitAnimate;
	CCAnimate *tailAnimate;
    CCAnimate *flyHitAnimate;//나는 동안에 총에 맞은 새를 나타내는 애니메이션
    CCAnimate *sitHitAnimate;//전선 위에 앉아있는 동안에 총에 맞은 새를 나타내는 애니메이션
    id delegate;
}
//아래의 변수들을 클래스 외부에서도 사용할 수 있도록 property로 선언합니다.
@property int HP;
@property int damage;
@property int point;
@property (nonatomic) BOOL isDead;
@property CGPoint sitPoint;
@property CGPoint startPoint;
@property (nonatomic, assign) CCAnimate *flyAnimate;
@property (nonatomic, assign) CCAnimate *sitAnimate;
@property (nonatomic, assign) CCAnimate *tailAnimate;
@property (nonatomic, assign) CCAnimate *flyHitAnimate;
@property (nonatomic, assign) CCAnimate *sitHitAnimate;
@property (nonatomic, assign) id delegate;

- (void)onEnter;
- (void)onTimer;
- (void)onLine;
- (void)hit;
- (void)hit:(int)hp;//hit:메소드를 추가합니다.
- (void)deadComplete;
- (void)die;
@end

@protocol BirdDelegate
- (void)deadComplete:(Bird *)bird;
- (void)birdAttack:(int)damage;
@end

