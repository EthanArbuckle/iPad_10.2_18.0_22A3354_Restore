@implementation GKOverlayServiceUtils

+ (void)showDashboardWithGame:(id)a3 deepLink:(id)a4 launchContext:(id)a5
{
  id v5;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a5;
  if (!a4)
  {
    v7 = 0;
    if (!a5)
      goto LABEL_5;
    goto LABEL_3;
  }
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  if (v5)
  {
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v5 = v8;
  }
LABEL_5:
  v9 = a3;
  static OverlayServiceUtils.showDashboard(game:deepLink:launchContext:)();

  swift_bridgeObjectRelease(v5, v10);
  swift_bridgeObjectRelease(v7, v11);
}

- (void)emitMultiplayerEventWithMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  GKOverlayServiceUtils *v7;
  Swift::String v8;
  uint64_t v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  OverlayServiceUtils.emitMultiplayerEvent(message:)(v8);

  swift_bridgeObjectRelease(v6, v9);
}

- (GKOverlayServiceUtils)init
{
  return (GKOverlayServiceUtils *)OverlayServiceUtils.init()();
}

- (void).cxx_destruct
{

}

@end
