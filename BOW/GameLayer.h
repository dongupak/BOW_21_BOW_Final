//
//  GameLayer.h
//  Action_Move
//
//  Created by 영록 이 on 11. 8. 12..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "BlueBird.h"
#import "RedBird.h"
#import "YellowBird.h"

@interface GameLayer : CCLayer {
    int bulletCount;
    int score;//점수 저장위한 변수
    int energy;
    
    CCAnimate *sitAnimate;
    CCAnimate *smokeAnimate;
    CCAnimate *tailAnimate;
    CCSprite *gunSmoke;
    CCArray *birdArray;
    CCArray *sitPositions;
    
    CCSprite *ptBulletSprite;
    CCSprite *ptReloadSprite;
    CCProgressTimer *ptBullet;
    CCProgressTimer *ptReload;
    CCProgressTimer *ptEnergyBar;
    CCLabelBMFont *lblScore;//화면에 점수를 나타낼 label
}
+(CCScene *) scene;
-(CGPoint)getStartPosition;
- (void)createEnergyBar;//전선의 에너지 상태를 나타내는 에너지 바
- (void)createGun;
- (void)createCloudWithSize:(int)imgSize top:(int)imgTop fileName:(NSString*)fileName interval:(int)interval z:(int)z;
@end
