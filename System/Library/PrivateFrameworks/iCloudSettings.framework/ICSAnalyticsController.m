@implementation ICSAnalyticsController

- (_TtC14iCloudSettings22ICSAnalyticsController)initWithAccount:(id)a3
{
  id v4;
  _TtC14iCloudSettings22ICSAnalyticsController *v5;

  v4 = a3;
  v5 = (_TtC14iCloudSettings22ICSAnalyticsController *)sub_24B587714(a3);

  return v5;
}

- (void)sendToggleEventForDataclassID:(id)a3 actionType:(int64_t)a4 enabled:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC14iCloudSettings22ICSAnalyticsController *v11;

  v8 = sub_24B5E42F0();
  v10 = v9;
  v11 = self;
  ICSAnalyticsController.sendToggleEvent(for:actionType:enabled:)(v8, v10, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)sendBackupToggleEventWithActionType:(int64_t)a3
{
  _TtC14iCloudSettings22ICSAnalyticsController *v4;

  v4 = self;
  ICSAnalyticsController.sendBackupToggleEvent(actionType:)(a3);

}

- (_TtC14iCloudSettings22ICSAnalyticsController)init
{
  _TtC14iCloudSettings22ICSAnalyticsController *result;

  result = (_TtC14iCloudSettings22ICSAnalyticsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
