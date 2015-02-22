//
//  DetailViewController.h
//  OfferU
//
//  Created by Xiaoping Li on 2/9/15.
//  Copyright (c) 2015 Luss Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UITextView *productDescription;

@property (nonatomic, strong) Product *product;

@end

