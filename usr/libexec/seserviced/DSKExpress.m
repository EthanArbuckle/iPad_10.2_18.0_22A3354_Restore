@implementation DSKExpress

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  swift_unknownObjectRetain(a4);
  swift_retain(self);
  sub_100144D44(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease(a4);
  swift_release(self);
  swift_bridgeObjectRelease(v8);
}

@end
