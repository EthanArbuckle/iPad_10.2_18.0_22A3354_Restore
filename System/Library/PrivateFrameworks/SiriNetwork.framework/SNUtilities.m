@implementation SNUtilities

+ (id)createUserAgentStringFromProductTypePrefix:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = static SNUtilities.createUserAgentString(fromProductTypePrefix:)(v3, v5);
  v8 = v7;
  swift_bridgeObjectRelease();
  v9 = (void *)MEMORY[0x24956D034](v6, v8);
  swift_bridgeObjectRelease();
  return v9;
}

- (SNUtilities)init
{
  return (SNUtilities *)SNUtilities.init()();
}

@end
