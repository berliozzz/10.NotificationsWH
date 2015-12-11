//
//  Doctor.m
//  NotificationTest
//
//  Created by Nikolay Berlioz on 15.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import "Doctor.h"
#import "Goverment.h"

@implementation Doctor

#pragma mark - Initialization

/**************  инициализация и добавление нотификаций   *********************/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self  //изменение зарплаты
                                                 selector:@selector(salaryChangedNotification:)
                                                     name:GovermentSalaryDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self   //изменение средней цены
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovermentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) salaryChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary)   //если зарплата меньше прежней зарплаты срабатывает этот нслог
    {
        NSLog(@"Doctors are not happy(salary is down)!");
    }
    else                        //в противном случае этот
    {
        NSLog(@"Doctors are happy(salary is up)!");
    }
    
    self.salary = salary;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    
    if (averagePrice < self.averagePrice)
    {
        NSLog(@"Doctor say: Average price is down, eaa! It's good!");
    }
    else
    {
        NSLog(@"Doctor say: Average price is up! It's very bad!");
    }
    self.averagePrice = averagePrice;
}


@end
