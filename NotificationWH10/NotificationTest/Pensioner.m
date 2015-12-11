//
//  Pensioner.m
//  NotificationTest
//
//  Created by Nikolay Berlioz on 15.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import "Pensioner.h"
#import "Goverment.h"

@implementation Pensioner
#pragma mark - Initialization

/**************  инициализация и добавление нотификаций   *********************/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self  //изменение зарплаты
                                                 selector:@selector(pensionChangedNotification:)
                                                     name:GovermentPensionDidChangeNotification
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

- (void) pensionChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentPensionUserInfoKey];
    
    CGFloat pension = [value floatValue];
    
    if (pension < self.pension)   //если налог меньше прежней зарплаты срабатывает этот нслог
    {
        NSLog(@"Pensioner are NOT happy(pension is down)!");
    }
    else                        //в противном случае этот
    {
        NSLog(@"Pensioner are happy(pension is up)!");
    }
    
    self.pension = pension;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    
    if (averagePrice < self.averagePrice)
    {
        NSLog(@"Pensioner say: Average price is down, eaa! It's good!");
    }
    else
    {
        NSLog(@"Pensioner say: Average price is up! It's very bad!");
    }
    self.averagePrice = averagePrice;
}


@end
