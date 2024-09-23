@implementation WFPPTDispatcher

+ (void)setupDatabaseForTesting
{
  swift_getObjCClassMetadata(a1);
  sub_1000278B0();
}

+ (BOOL)dispatchTest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_getObjCClassMetadata(a1);
  LOBYTE(a1) = sub_100027C6C(v4, v6);
  swift_bridgeObjectRelease(v6);
  return a1 & 1;
}

- (WFPPTDispatcher)init
{
  return (WFPPTDispatcher *)sub_10002B058();
}

@end
