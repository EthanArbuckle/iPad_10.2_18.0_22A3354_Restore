@implementation DKMOpenClosedInterval

- (id)standardIntervalString
{
  return CFSTR("(%@, %@]");
}

- (id)negativeInfinityIntervalString
{
  return CFSTR("<=%@");
}

- (id)positiveInfinityIntervalString
{
  return CFSTR(">%@");
}

@end
