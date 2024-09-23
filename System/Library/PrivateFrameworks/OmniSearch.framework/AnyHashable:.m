@implementation AnyHashable:

- (uint64_t)Any
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_75();
  v2 = OUTLINED_FUNCTION_35_3();
  v1(v2);
  OUTLINED_FUNCTION_50();
  return swift_bridgeObjectRelease();
}

@end
