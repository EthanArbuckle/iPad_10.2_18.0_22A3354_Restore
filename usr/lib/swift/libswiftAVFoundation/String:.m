@implementation String:

- (uint64_t)Sendable
{
  return swift_release();
}

@end
