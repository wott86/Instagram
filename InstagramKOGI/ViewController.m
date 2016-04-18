//
//  ViewController.m
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/16/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "Instagram.h"
#import "InstagramObject.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *data;
@property (nonatomic)  NSInteger selectedIndex;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) UIImage *previewImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle: nil];
    
    _previewImage = [UIImage imageNamed:@"preview"];
    
    [_collectionView registerNib:nib forCellWithReuseIdentifier:kCollectionViewCellIdentifier];

    [self getFeed];
    
}

- (IBAction)handleRightSwipe:(id)sender {
    if (_selectedIndex - 1 >= 0) {
        [self setSelectedIndex:(_selectedIndex - 1)];
    }
}

- (IBAction)handleLeftSwipe:(id)sender {
    if (_selectedIndex + 1 < [_data count]) {
        [self setSelectedIndex:(_selectedIndex + 1)];
    }
}

-(void)getFeed {
    
    [Instagram getInstagramFeedCompletion:^(id responseObject, NSError *error) {
        
        if (error) {
            NSLog(@"Error: %@",error);
            return;
        }

            
        _data = responseObject;
        [self setSelectedIndex:0];
        [_collectionView reloadData];
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_data count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [_data count] ? 1 : 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
    
    InstagramObject *instagramObject = [_data objectAtIndex:indexPath.row];
    
    [self configureCell:cell withInstagramObject:instagramObject];
    
    return cell;
}

-(void)configureCell:(CollectionViewCell *)cell withInstagramObject:(InstagramObject *)instagramObject {
    
    cell.label.text = instagramObject.caption;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [cell.imageView setImageWithURL:instagramObject.photo_thumbnail placeholderImage:_previewImage];
    });
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [self setSelectedIndex:indexPath.row];
}

-(void)setSelectedIndex:(NSInteger)selectedIndex {
    if  (selectedIndex < [_data count]) {
    
        _selectedIndex = selectedIndex;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            InstagramObject *instagramObject = [_data objectAtIndex:selectedIndex];
            [_imageView setImageWithURL:instagramObject.photo_thumbnail placeholderImage:_previewImage];
        });
        
    }
    
}

- (IBAction)refreshButtonClicked:(id)sender {
    [self getFeed];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[DetailsViewController class]]) {
        DetailsViewController *destinationViewController = (DetailsViewController *)segue.destinationViewController;
        destinationViewController.selectedObject = [_data objectAtIndex:_selectedIndex];
    }
}


@end
