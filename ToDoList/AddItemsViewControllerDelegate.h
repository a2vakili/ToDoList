//
//  AddItemsViewControllerDelegate.h
//  ToDoList
//
//  Created by Alex on 2015-06-24.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDo.h"

@protocol AddItemsViewControllerDelegate <NSObject>

-(void)makeNewToDoListItem:(ToDo *)newToDoItem;


@end
