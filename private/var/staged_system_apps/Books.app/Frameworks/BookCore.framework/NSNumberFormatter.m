@implementation NSNumberFormatter

+ (id)imaxLocalizedUnsignedInteger:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v4, 0));

  return v5;
}

+ (id)imaxLocalizedUnsignedInteger:(unint64_t)a3 usesGroupingSeparator:(BOOL)a4
{
  void *v5;
  NSNumberFormatter *v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imaxLocalizedUnsignedInteger:", a3));
  }
  else
  {
    v6 = objc_opt_new(NSNumberFormatter);
    -[NSNumberFormatter setNumberStyle:](v6, "setNumberStyle:", 1);
    -[NSNumberFormatter setUsesGroupingSeparator:](v6, "setUsesGroupingSeparator:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    -[NSNumberFormatter setLocale:](v6, "setLocale:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v6, "stringFromNumber:", v8));

  }
  return v5;
}

+ (id)imaxLocalizedDouble:(double)a3
{
  return _objc_msgSend(a1, "imaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1, a3);
}

+ (id)imaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v6, a4));

  return v7;
}

+ (id)imaxLocalizedPercentage:(double)a3
{
  return objc_msgSend(a1, "imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1, a3);
}

+ (id)imaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v6, 3, a4));

  return v7;
}

+ (id)imaxLocalizedNumber:(id)a3
{
  return objc_msgSend(a1, "imaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1);
}

+ (id)imaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return objc_msgSend(a1, "imaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1, a4);
}

+ (id)imaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4
{
  return objc_msgSend(a1, "imaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, a4, 1);
}

+ (id)imaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  id v7;
  NSNumberFormatter *v8;
  void *v9;

  v7 = a3;
  v8 = objc_opt_new(NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v8, "setNumberStyle:", a4);
  -[NSNumberFormatter setMaximumFractionDigits:](v8, "setMaximumFractionDigits:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v8, "stringFromNumber:", v7));

  return v9;
}

+ (id)localizedStringFromNumber:(id)a3 numberStyle:(unint64_t)a4 auxiliarySymbolSuffix:(id)a5
{
  id v7;
  id v8;
  NSNumberFormatter *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a3;
  v9 = objc_opt_new(NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v9, "setNumberStyle:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v9, "stringFromNumber:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v10, v7));
  return v11;
}

@end
