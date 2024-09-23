@implementation DIPPushNotificationManager

- (_TtC8coreidvd26DIPPushNotificationManager)init
{
  return (_TtC8coreidvd26DIPPushNotificationManager *)sub_1004F2F08();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC8coreidvd26DIPPushNotificationManager *v11;

  if (a4)
  {
    v6 = a3;
    v11 = self;
    v7 = a4;
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = v9;

    sub_100007F8C(v8, v10);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd26DIPPushNotificationManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004F6750(a4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->coreidvdTopic[OBJC_IVAR____TtC8coreidvd26DIPPushNotificationManager_coreidvdTopic]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->coreidvdTopic[OBJC_IVAR____TtC8coreidvd26DIPPushNotificationManager_pdsClientId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->coreidvdTopic[OBJC_IVAR____TtC8coreidvd26DIPPushNotificationManager_proofingSessionId]);

}

@end
