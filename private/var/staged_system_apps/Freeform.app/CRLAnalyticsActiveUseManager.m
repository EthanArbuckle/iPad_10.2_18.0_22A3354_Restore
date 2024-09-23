@implementation CRLAnalyticsActiveUseManager

+ (_TtC8Freeform28CRLAnalyticsActiveUseManager)sharedManager
{
  if (qword_1013DCB08 != -1)
    swift_once(&qword_1013DCB08, sub_1005D8770);
  return (_TtC8Freeform28CRLAnalyticsActiveUseManager *)(id)static CRLAnalyticsActiveUseManager.shared;
}

- (_TtC8Freeform28CRLAnalyticsActiveUseManager)init
{
  return (_TtC8Freeform28CRLAnalyticsActiveUseManager *)sub_1005D885C();
}

- (void)dealloc
{
  _TtC8Freeform28CRLAnalyticsActiveUseManager *v2;

  v2 = self;
  CRLAnalyticsActiveUseManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_appForegroundedAnalyticsDomain]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_deviceIDAnalyticsKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_userIDAnalyticsKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_supportsEndToEndEncryptionKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_overriddenUserIDAnalyticsKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_hadiCloudAccountAnalyticsKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appForegroundedAnalyticsDomain[OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_hadQuotaViolationKey]);

}

- (void)handleConflictOccurred:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform28CRLAnalyticsActiveUseManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005D9A94((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)handleQuotaViolationOccurred
{
  _TtC8Freeform28CRLAnalyticsActiveUseManager *v2;

  v2 = self;
  sub_1005D9DFC();

}

- (void)handleSupportsEndToEndEncryptionValueChanged
{
  _TtC8Freeform28CRLAnalyticsActiveUseManager *v2;

  v2 = self;
  sub_1005D9A90();

}

@end
