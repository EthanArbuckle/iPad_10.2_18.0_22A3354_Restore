@implementation Int:@Sendable

- (uint64_t)()
{
  return swift_release();
}

@end
