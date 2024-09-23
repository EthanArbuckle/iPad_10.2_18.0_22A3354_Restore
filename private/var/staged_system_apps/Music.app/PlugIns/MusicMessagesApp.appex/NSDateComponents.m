@implementation NSDateComponents

- (NSString)lastUpdatedDateString
{
  NSDateComponents *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  NSDateComponents.lastUpdatedDateString.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
