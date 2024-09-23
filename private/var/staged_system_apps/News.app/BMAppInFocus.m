@implementation BMAppInFocus

- (int64_t)type
{
  return 3;
}

- (NSString)content
{
  return (NSString *)-[BMAppInFocus bundleID](self, "bundleID");
}

- (NSDate)date
{
  return (NSDate *)-[BMAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
}

@end
