@implementation AnyHashable:

- (uint64_t)Any
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

@end
