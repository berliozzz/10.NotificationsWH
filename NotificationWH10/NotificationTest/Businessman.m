//
//  Businessman.m
//  NotificationTest
//
//  Created by Nikolay Berlioz on 15.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import "Businessman.h"
#import "Goverment.h"

@implementation Businessman

#pragma mark - Initialization

/**************  инициализация и добавление нотификаций   *********************/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self  //изменение зарплаты
                                                 selector:@selector(taxLevelChangedNotification:)
                                                     name:GovermentTaxLevelDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self   //изменение средней цены
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovermentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

/**************  Удаляем все нотификации после выполнения   *********************/
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) taxLevelChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentTaxLevelUserInfoKey];
    
    CGFloat taxLevel = [value floatValue];
    
    if (taxLevel < self.taxLevel)   //если налог меньше прежней зарплаты срабатывает этот нслог
    {
        NSLog(@"Businessman are happy(tax level is down)!");
    }
    else                        //в противном случае этот
    {
        NSLog(@"Businessman are NOT happy(tax level is up)!");
    }
    
    self.taxLevel = taxLevel;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    
    if (averagePrice < self.averagePrice)
    {
        NSLog(@"Businessman say: Average price is down, eaa! It's good!");
    }
    else
    {
        NSLog(@"Businessman say: Average price is up! It's very bad!");
    }
    self.averagePrice = averagePrice;
}

@end
