//
//  WKACoverCellNode.m
//  FuncsTestProject
//
//  Created by 刘云 on 1/6/18.
//  Copyright © 2018年 王康康. All rights reserved.
//
#import "WKACoverCellNode.h"

#define IMGHEIGHT 250

@interface WKACoverCellNode () <ASNetworkImageNodeDelegate>
@end
@implementation WKACoverCellNode

{
    ASNetworkImageNode *_coverImgNode;
}
-(instancetype)initWithImgURL:(NSString *)imgURL {
    self = [super init];
    
    if (self) {
        
        _coverImgNode             = [[ASNetworkImageNode alloc]init];
        _coverImgNode.delegate    = self;
        _coverImgNode.URL         = [NSURL URLWithString:imgURL];
        _coverImgNode.layerBacked = YES;
        // instead of adding everything addSubnode:
        self.automaticallyManagesSubnodes = YES;

        
        //为滑动效果添加的代码
        self.clipsToBounds = YES;
        
    }
    return self;
}
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

    ASStackLayoutSpec *vStack = [ASStackLayoutSpec verticalStackLayoutSpec];

    
    CGRect screenRect   = [[UIScreen mainScreen] bounds];
    //CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenWidthImageSize = CGSizeMake(screenRect.size.width, IMGHEIGHT * 2);
    _coverImgNode.style.preferredSize = screenWidthImageSize;

    [vStack setChild:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(-0.5 * IMGHEIGHT, 0, 0, 0) child:_coverImgNode]];
    vStack.style.maxSize = CGSizeMake(screenRect.size.width, IMGHEIGHT);

    return vStack;
}
-(void)cellOffsetWithTableNode:(ASTableNode *)tableNode {

    CGRect centerToWindow = [self convertRect:self.bounds toNode:nil];
    CGFloat centerY = CGRectGetMidY(centerToWindow);

    CGPoint windowCenter = tableNode.position;
    CGFloat cellOffsetY = centerY - windowCenter.y;
    CGFloat tableHeight = tableNode.frame.size.height;
    
    CGFloat offsetDig = (cellOffsetY / tableHeight)*(IMGHEIGHT);
    CATransform3D transY = CATransform3DMakeTranslation(0, -offsetDig, 0);
    _coverImgNode.transform = transY;
}

#pragma mark - Instance Methods

- (void)didEnterPreloadState
{
    [super didEnterPreloadState];
}


#pragma mark - network Img Delegate
-(void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image info:(ASNetworkImageLoadInfo *)info {
    // Docs say method is called from bg but right now it's called from main.
    // Save main thread time by shunting this.
    if (info.sourceType == ASNetworkImageSourceDownload) {
        ASPerformBlockOnBackgroundThread(^{
            NSLog(@"received image %@ from %@ with userInfo %@", image, info.url.path, ASObjectDescriptionMakeTiny(info.userInfo));
        });
    }
}





@end















