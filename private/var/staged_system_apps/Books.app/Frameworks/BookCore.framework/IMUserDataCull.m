@implementation IMUserDataCull

+ (unint64_t)maxDeletedAge
{
  return 7776000;
}

+ (BOOL)isTimestampTrustworthy:(unint64_t)a3
{
  return a3 - 1229904001 < 0xFFFFFFFFB6B1277ELL;
}

+ (BOOL)isTimestamp:(unint64_t)a3 newerThanMaxAgeFromRightNow:(unint64_t)a4
{
  return (unint64_t)objc_msgSend((id)objc_opt_class(a1), "maxDeletedAge") + a3 > a4;
}

+ (BOOL)isTimestampNewerThanMaxDeletedAge:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  if (!objc_msgSend((id)objc_opt_class(a1), "isTimestampTrustworthy:", a3)
    || !objc_msgSend((id)objc_opt_class(a1), "isTimestampTrustworthy:", (unint64_t)v7))
  {
    return 1;
  }
  v8 = (void *)objc_opt_class(a1);
  return _objc_msgSend(v8, "isTimestamp:newerThanMaxAgeFromRightNow:", a3, (unint64_t)v7);
}

@end
