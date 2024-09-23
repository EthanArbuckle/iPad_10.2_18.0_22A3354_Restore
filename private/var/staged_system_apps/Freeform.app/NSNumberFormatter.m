@implementation NSNumberFormatter

+ (id)crlaxLocalizedUnsignedInteger:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crlaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v4, 0));

  return v5;
}

+ (id)crlaxLocalizedDouble:(double)a3
{
  return _objc_msgSend(a1, "crlaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1, a3);
}

+ (id)crlaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crlaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v6, a4));

  return v7;
}

+ (id)crlaxLocalizedPercentage:(double)a3
{
  return _objc_msgSend(a1, "crlaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1, a3);
}

+ (id)crlaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crlaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v6, 3, a4));

  return v7;
}

+ (id)crlaxLocalizedNumber:(id)a3
{
  return objc_msgSend(a1, "crlaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1);
}

+ (id)crlaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return objc_msgSend(a1, "crlaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1, a4);
}

+ (id)crlaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4
{
  return objc_msgSend(a1, "crlaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, a4, 1);
}

+ (id)crlaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
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

- (_NSRange)crl_rangeOfNumericValueInString:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = sub_100D3020C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_100D2F590);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSString)crl_format
{
  NSNumberFormatter *v2;
  NSString v3;

  v2 = self;
  sub_100D2FBB8();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)crl_setFormat:(id)a3
{
  NSNumberFormatter *v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v4 = self;
  sub_100D2FDCC();

}

@end
