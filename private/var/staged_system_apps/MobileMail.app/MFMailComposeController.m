@implementation MFMailComposeController

- (void)associateViewWithEntityWithAutosaveId:(id)a3
{
  id v3;
  MFMailComposeController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_getObjectType();
  v3 = a3;
  v4 = self;
  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v5;

    v8 = v6;
    v9 = v7;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  sub_10038E3C0(v8, v9);
  swift_bridgeObjectRelease(v9);

}

@end
