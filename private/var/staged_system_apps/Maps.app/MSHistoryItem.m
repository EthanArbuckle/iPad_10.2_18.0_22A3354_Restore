@implementation MSHistoryItem

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class(MSHistoryItem);
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (BOOL)isFailed
{
  return 0;
}

- (BOOL)tracksRAPReportingOnly
{
  return 0;
}

@end
