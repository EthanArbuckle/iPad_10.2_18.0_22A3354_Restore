@implementation BMAppWebUsage

- (int64_t)type
{
  return 1;
}

- (NSString)content
{
  return (NSString *)-[BMAppWebUsage webpageURL](self, "webpageURL");
}

- (NSDate)date
{
  return (NSDate *)-[BMAppWebUsage absoluteTimestamp](self, "absoluteTimestamp");
}

@end
