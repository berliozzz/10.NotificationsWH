//
//  Goverment.h
//  NotificationTest
//
//  Created by Nikolay Berlioz on 14.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

/**************  объявление нитификаций скрытое инкапсуляцией   *********************/
extern NSString* const GovermentTaxLevelDidChangeNotification;
extern NSString* const GovermentSalaryDidChangeNotification;
extern NSString* const GovermentPensionDidChangeNotification;
extern NSString* const GovermentAveragePriceDidChangeNotification;

/**************  объявление ключей скрытое инкапсуляцией   *********************/
extern NSString* const GovermentTaxLevelUserInfoKey;
extern NSString* const GovermentSalaryUserInfoKey;
extern NSString* const GovermentPensionUserInfoKey;
extern NSString* const GovermentAveragePriceUserInfoKey;

@interface Goverment : NSObject

/**************  свойства   *********************/
@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;


@end
