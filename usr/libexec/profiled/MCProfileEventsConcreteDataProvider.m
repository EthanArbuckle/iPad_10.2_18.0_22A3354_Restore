@implementation MCProfileEventsConcreteDataProvider

- (id)currentTime
{
  return +[NSDate date](NSDate, "date");
}

@end
