//
//  MasterViewController.m
//  ToDoList
//
//  Created by Alex on 2015-06-24.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"
#import "AddItemsViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (IBAction)swipeToCrossOut:(id)sender {
    UISwipeGestureRecognizer *swipeGesture = (UISwipeGestureRecognizer *)sender;
    CGPoint cellLocation = [swipeGesture locationInView:self.tableView];
    NSIndexPath *cellFromSwipe = [self.tableView indexPathForRowAtPoint:cellLocation];
    
    NSNumber *strikeSize = [NSNumber numberWithInt:2];
    
    NSDictionary *strikeThroughAttribute = [NSDictionary dictionaryWithObject:strikeSize
                                                                       forKey:NSStrikethroughStyleAttributeName];

    ToDoCell *cellToStrikethrough = (ToDoCell *)[self.tableView cellForRowAtIndexPath:cellFromSwipe];
    NSString *stringToStrikeThrough = cellToStrikethrough.cellTitle.text;
    NSAttributedString *strikeThroughText = [[NSAttributedString alloc] initWithString:stringToStrikeThrough
                                                                            attributes:strikeThroughAttribute];

    cellToStrikethrough.cellTitle.attributedText = strikeThroughText;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)loadData {
    self.objects = [[NSMutableArray alloc] init];
    ToDo *toDoItem1 = [[ToDo alloc] init];
    toDoItem1.title = @"code";
    toDoItem1.itemDescription = @"code all day";
    toDoItem1.priorityNumber = @1;
    [self.objects addObject:toDoItem1];
    ToDo *toDoItem2 = [[ToDo alloc] init];
    toDoItem2.title = @"drink coffee";
    toDoItem2.itemDescription = @"don't drink too much coffee";
    toDoItem2.priorityNumber = @3;
    [self.objects addObject:toDoItem2];
    ToDo *toDoItem3 = [[ToDo alloc] init];
    toDoItem3.title = @"sleep";
    toDoItem3.itemDescription = @"try and sleep";
    toDoItem3.priorityNumber = @2;
    [self.objects addObject:toDoItem3];
    NSLog(@"objects array: %@", self.objects);
}
- (void)viewDidLoad {
    [self loadData];
    [super viewDidLoad];
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self performSegueWithIdentifier:@"addToDoItem" sender:sender];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
    if([[segue identifier] isEqualToString:@"addToDoItem"]) {
        AddItemsViewController *addItemsViewController = [segue destinationViewController];
        addItemsViewController.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (ToDoCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    
    ToDo *object = self.objects[indexPath.row];
    cell.cellTitle.text = [object title];
    cell.itemDescription.text = [object itemDescription];
    cell.priority.text = [[object priorityNumber] stringValue];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)makeNewToDoListItem:(ToDo *)newToDoItem
{
    [self.objects addObject:newToDoItem];
    [self.tableView reloadData];
}

@end
