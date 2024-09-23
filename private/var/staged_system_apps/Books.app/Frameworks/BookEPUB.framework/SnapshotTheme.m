@implementation SnapshotTheme

- (NSString)snapshotIdentifier
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  swift_retain();
  sub_197D0C();
  v3 = v2;
  swift_release();
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

@end
