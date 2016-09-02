//
//  ViewController.m
//  BFCollectionViewDemo
//
//  Created by Readboy_BFAlex on 16/8/3.
//  Copyright © 2016年 BFAlex. All rights reserved.
//

#import "ViewController.h"
#import "BFCollectionViewCell.h"

#define kCollectionCellID @"CollectionCellID"
#define kCellWith   10
#define kCellHeight 10

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

#pragma mark - cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - customized

- (void)setupCollectionView {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = flowLayout;
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionCellID];
    [self.collectionView registerClass:[BFCollectionViewCell class] forCellWithReuseIdentifier:kCollectionCellID];
    
    self.collectionView.backgroundColor = [UIColor yellowColor];
}

#pragma mark - DataSource && Delegate
#pragma mark - UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return section + 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cvCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellID forIndexPath:indexPath];
    
//    cvCell.backgroundColor = [UIColor purpleColor];
    
    return cvCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击第%zd区的第%zd个Cell", indexPath.section, indexPath.row);
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __func__);
    
    return (CGSize){kCellWith, kCellHeight};
}

@end
