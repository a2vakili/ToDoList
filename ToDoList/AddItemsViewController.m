//
//  AddItemsViewController.m
//  ToDoList
//
//  Created by Alex on 2015-06-24.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "AddItemsViewController.h"


@interface AddItemsViewController ()

@end

@implementation AddItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonPressed:(id)sender {
    ToDo *newToDoListItem = [[ToDo alloc] init];
    newToDoListItem.title = self.itemTitle.text;
    newToDoListItem.itemDescription = self.itemDetails.text;
    [self setPriorityLevel];
    newToDoListItem.priorityNumber = self.itemPriority;
    [self.delegate makeNewToDoListItem:newToDoListItem];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)setPriorityLevel {
    if(self.setPriority.selectedSegmentIndex == 2){
        self.itemPriority = @1;
    }
    else if (self.setPriority.selectedSegmentIndex == 1) {
        self.itemPriority = @2;
    }
    else {
        self.itemPriority = @3;
    }
    
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
