@implementation THKTaskEvent

- (NSString)id
{
  void *v2;

  sub_2464B935C();
  v2 = (void *)sub_2464F8B64();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeIntervalSinceReferenceDate
{
  return sub_2464B93B4();
}

- (_TtC23SiriInvocationAnalytics12THKTaskEvent)init
{
  THKTaskEvent.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
