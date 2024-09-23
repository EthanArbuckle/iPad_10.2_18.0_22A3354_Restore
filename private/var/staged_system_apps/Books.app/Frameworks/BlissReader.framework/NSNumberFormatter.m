@implementation NSNumberFormatter

+ (id)tsaxLocalizedUnsignedInteger:(unint64_t)a3
{
  return objc_msgSend(a1, "tsaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), 0);
}

+ (id)tsaxLocalizedDouble:(double)a3
{
  return objc_msgSend(a1, "tsaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1, a3);
}

+ (id)tsaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return objc_msgSend(a1, "tsaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), a4);
}

+ (id)tsaxLocalizedPercentage:(double)a3
{
  return objc_msgSend(a1, "tsaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1, a3);
}

+ (id)tsaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return objc_msgSend(a1, "tsaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), 3, a4);
}

+ (id)tsaxLocalizedNumber:(id)a3
{
  return objc_msgSend(a1, "tsaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1);
}

+ (id)tsaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return objc_msgSend(a1, "tsaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1, a4);
}

+ (id)tsaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4
{
  return objc_msgSend(a1, "tsaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, a4, 1);
}

+ (id)tsaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  void *v8;
  id v9;

  v8 = (void *)objc_opt_new(NSNumberFormatter, a2);
  objc_msgSend(v8, "setNumberStyle:", a4);
  objc_msgSend(v8, "setMaximumFractionDigits:", a5);
  v9 = objc_msgSend(v8, "stringFromNumber:", a3);

  return v9;
}

@end
