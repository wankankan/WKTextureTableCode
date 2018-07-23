//
//  WKAHomePageViewController.m
//  FuncsTestProject
//
//  Created by 刘云 on 31/5/18.
//  Copyright © 2018年 王康康. All rights reserved.
//

#import "WKAHomePageViewController.h"
#import "WKACoverCellNode.h"
@interface WKAHomePageViewController ()<ASTableDelegate,ASTableDataSource>

@property(nonatomic, strong)ASTableNode *tableNode;
@property(nonatomic, strong)NSArray * imgsUrlArray;

@end

@implementation WKAHomePageViewController

-(instancetype)init {
    _tableNode = [[ASTableNode alloc]init];
    self = [super initWithNode:_tableNode];
    if (self) {
        self.navigationItem.title = @"ASDK TABLE";
        [self.navigationController setNavigationBarHidden:YES];
        
        _tableNode.dataSource = self;
        _tableNode.delegate   = self;
        _imgsUrlArray = @[
                          @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528091726182&di=99f460c7a718849b0b23b971c632a836&imgtype=0&src=http%3A%2F%2Fwww.vansfans.cn%2Fimg%2F2016%2F03%2Ftumblr_nj9lb5Xsrk1s4z805o1_1280.jpg",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067921_IMG_20171117_175538_0120.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067920_IMG_20171117_175355_0116.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067919_IMG_20171117_023020_0104.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067915_IMG_20171117_175335_0114.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067917_IMG_20171117_175345_0115.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067913_IMG_20171116_225027_0096.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067906_IMG_20171116_225037_0097.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067925_IMG_20171117_175409_0118.JPG",
                          @"https://bbsimg.fengimg.com/2017/11/18/14067922_IMG_20171116_225348_0100.JPG"
                          ];
        
    }
    return self;
}
-(void)loadView {
    [super loadView];
    
}
#pragma mark - ASTableDataSource methods
-(NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        WKACoverCellNode * cellNode =[[WKACoverCellNode alloc]initWithImgURL:self.imgsUrlArray[indexPath.row]];
        return cellNode;
    };
    
    return ASCellNodeBlock;
}
-(void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[WKAHomePageViewController new] animated:YES];
    
}
-(void)dealloc {
    NSLog(@"______dealloc_______");
}
-(void)tableNode:(ASTableNode *)tableNode willDisplayRowWithNode:(WKACoverCellNode *)node {
    [node cellOffsetWithTableNode:_tableNode];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray<WKACoverCellNode *> *array = [self.tableNode visibleNodes];
    [array enumerateObjectsUsingBlock:^(WKACoverCellNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj cellOffsetWithTableNode:self.tableNode];
    }];
}

#pragma mark - ASTableDelegate methods
-(void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
    //    [context beginBatchFetching];
    // loading more
}

@end
