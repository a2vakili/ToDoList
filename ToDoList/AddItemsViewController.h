//
//  AddItemsViewController.h
//  ToDoList
//
//  Created by Alex on 2015-06-24.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *itemDetails;
@property (weak, nonatomic) IBOutlet UITextField *itemPriority;
@property (weak, nonatomic) IBOutlet UITextField *itemTitle;

@end
