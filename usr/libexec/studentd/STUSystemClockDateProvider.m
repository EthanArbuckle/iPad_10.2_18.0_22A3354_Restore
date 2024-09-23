@implementation STUSystemClockDateProvider

- (NSDate)currentDate
{
  return +[NSDate date](NSDate, "date");
}

- (NSDate)distantPast
{
  return +[NSDate distantPast](NSDate, "distantPast");
}

- (NSDate)distantFuture
{
  return +[NSDate distantFuture](NSDate, "distantFuture");
}

- (NSString)sessionToken
{
  return (NSString *)CFSTR("STUSystemClockSessionToken");
}

@end
