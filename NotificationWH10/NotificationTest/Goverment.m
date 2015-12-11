//
//  Goverment.m
//  NotificationTest
//
//  Created by Nikolay Berlioz on 14.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import "Goverment.h"

NSString* const GovermentTaxLevelDidChangeNotification = @"GovermentTaxLevelDidChangeNotification";
NSString* const GovermentSalaryDidChangeNotification = @"GovermentSalaryDidChangeNotification";
NSString* const GovermentPensionDidChangeNotification = @"GovermentPensionDidChangeNotification";
NSString* const GovermentAveragePriceDidChangeNotification = @"GovermentAveragePriceDidChangeNotification";

NSString* const GovermentTaxLevelUserInfoKey = @"GovermentTaxLevelUserInfoKey";
NSString* const GovermentSalaryUserInfoKey = @"GovermentSalaryUserInfoKey";
NSString* const GovermentPensionUserInfoKey = @"GovermentPensionUserInfoKey";
NSString* const GovermentAveragePriceUserInfoKey = @"GovermentAveragePriceUserInfoKey";

@implementation Goverment

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _taxLevel =  5.f;
        _salary = 1000.f;
        _pension = 500.f;
        _averagePrice = 10.f;
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel
{
    _taxLevel = taxLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:taxLevel] forKey:GovermentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentTaxLevelDidChangeNotification
                                                        object:nil
                                                       userInfo:dictionary];
}

- (void) setSalary:(CGFloat)salary
{
    _salary = salary;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:salary] forKey:GovermentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension
{
    _pension = pension;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:pension] forKey:GovermentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setAveragePrice:(CGFloat)averagePrice
{
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:averagePrice] forKey:GovermentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}
@end
