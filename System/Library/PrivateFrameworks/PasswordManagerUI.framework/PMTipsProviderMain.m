@implementation PMTipsProviderMain

- (void)refreshTips
{
  uint64_t v2;

  swift_beginAccess();
  swift_retain();
  v2 = swift_bridgeObjectRetain();
  sub_24381D22C(v2);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
