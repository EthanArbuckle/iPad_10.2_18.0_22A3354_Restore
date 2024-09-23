@implementation CardAuxiliaryNavigationBarViewModel

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  void *v9;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  swift_retain(self);
  sub_111418(v7, v9, a4);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
}

@end
