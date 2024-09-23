@implementation CRLDocumentSessionAnalyticsManager

- (_TtC8Freeform34CRLDocumentSessionAnalyticsManager)initWithScene:(id)a3 commandController:(id)a4 mode:(id)a5
{
  return (_TtC8Freeform34CRLDocumentSessionAnalyticsManager *)sub_100866EA0(a3, a4, a5);
}

- (void)observeCommandController:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_commandControllerNotificationSubscriber);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_commandControllerNotificationSubscriber) = (Class)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v3);
}

- (void)beginSession
{
  _TtC8Freeform34CRLDocumentSessionAnalyticsManager *v2;

  v2 = self;
  CRLDocumentSessionAnalyticsManager.beginSession()();

}

- (void)endSessionClosingDocument:(BOOL)a3
{
  _TtC8Freeform34CRLDocumentSessionAnalyticsManager *v4;

  v4 = self;
  CRLDocumentSessionAnalyticsManager.endSession(isClosingDocument:)(a3);

}

- (void)beginSession:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform34CRLDocumentSessionAnalyticsManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  CRLDocumentSessionAnalyticsManager.beginSession()();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)endSession:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform34CRLDocumentSessionAnalyticsManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  CRLDocumentSessionAnalyticsManager.endSession(isClosingDocument:)(0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8Freeform34CRLDocumentSessionAnalyticsManager)init
{
  _TtC8Freeform34CRLDocumentSessionAnalyticsManager *result;

  result = (_TtC8Freeform34CRLDocumentSessionAnalyticsManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLDocumentSessionAnalyticsManager", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1004C113C((uint64_t)self + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_sessionBeganDate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_currentMode));
  sub_1004C113C((uint64_t)self + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_modeBeganDate);
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC8Freeform34CRLDocumentSessionAnalyticsManager *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  _s8Freeform34CRLDocumentSessionAnalyticsManagerC18didSetDocumentMode_4from8animatedySo014CRLiOSDocumentI0C_AHSbtF_0(v7, v8);

}

@end
