//
//  MasterViewController.m
//  OfferU
//
//  Created by Xiaoping Li on 2/9/15.
//  Copyright (c) 2015 Luss Studio. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Product.h"

@interface MasterViewController ()

@property NSArray *objects;
@property NSArray *searchResult;
//initialize in the interface builder
@property (strong, nonatomic) IBOutlet UITableView *searchbar;


@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Product *product1 = [[Product alloc] init];
    product1.name = @"basketball";
    product1.image = @"basketball.png";
    _objects = [NSArray arrayWithObjects:product1, nil];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    //add tap gesture for this viewcontroller. and dismiss keyboard for this tap.
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self action:@selector(dismissKeyboard)];
    
//    [self.view addGestureRecognizer:tap];
}

//// dismiss keyboard when tap
//- (void)dismissKeyboard
//{
//    [self.searchbar resignFirstResponder];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self performSegueWithIdentifier:@"showProduct" sender:tableView];
//}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView){
        return [_searchResult count];
    }else{
        return self.objects.count;
    }
}

- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Product *product = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = product.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
 * this is a method to check in the running time
 */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showProduct"]){
        NSIndexPath *indexPath = nil;
        Product *product = nil;
//        if (self.searchDisplayController.active){
//            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
//            product = [_searchResult objectAtIndex:indexPath.row];
//        }else{
            indexPath = [self.tableView indexPathForSelectedRow];
            NSLog(@"the row is %d", indexPath.row);
            product = [_objects objectAtIndex:indexPath.row];
//        }
        
        DetailViewController *productView = segue.destinationViewController;
        productView.product = product;
    }
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

@end
