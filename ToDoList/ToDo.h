//
//  ToDo.h
//  ToDoList
//
//  Created by Alex on 2015-06-24.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *itemDescription;
@property(strong, nonatomic) NSNumber *priorityNumber;
@property(nonatomic) BOOL isCompleted;

@end
