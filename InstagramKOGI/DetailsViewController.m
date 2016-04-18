//
//  DetailsViewController.m
//  InstagramKOGI
//
//  Created by Cesar Vilera on 4/17/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *publishDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureView {
    if (!_selectedObject) {
        return;
    }
    
    _publishDateLabel.text = [self.selectedObject dateToString];
    _authorLabel.text = _selectedObject.author;
    _tagsLabel.text = [_selectedObject tagsToString];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_imageView setImageWithURL:_selectedObject.photo placeholderImage:[UIImage imageNamed:@"preview"]];
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
