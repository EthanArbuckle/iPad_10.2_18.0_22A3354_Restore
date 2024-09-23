@implementation ApplePushServiceManager

+ (_TtC14bluetoothuserd23ApplePushServiceManager)shared
{
  if (qword_10007D330 != -1)
    swift_once(&qword_10007D330, sub_100006F38);
  return (_TtC14bluetoothuserd23ApplePushServiceManager *)(id)qword_1000809B8;
}

- (_TtC14bluetoothuserd23ApplePushServiceManager)init
{
  return (_TtC14bluetoothuserd23ApplePushServiceManager *)sub_100007174();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  id v6;
  _TtC14bluetoothuserd23ApplePushServiceManager *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC14bluetoothuserd23ApplePushServiceManager *v12;

  v4 = a4;
  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    v4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v10 = v9;

  }
  else
  {
    v11 = a3;
    v12 = self;
    v10 = 0xF000000000000000;
  }
  sub_10000874C((uint64_t)v4, v10);
  sub_1000093D8((uint64_t)v4, v10);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8;
  id v10;
  id v11;
  id v12;
  _TtC14bluetoothuserd23ApplePushServiceManager *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  _TtC14bluetoothuserd23ApplePushServiceManager *v26;

  v8 = a4;
  if (a4)
  {
    v10 = a3;
    v11 = a5;
    v12 = a6;
    v13 = self;
    v14 = v8;
    v8 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v16 = v15;

    if (a5)
      goto LABEL_3;
LABEL_6:
    v17 = 0;
    v19 = 0;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v20 = 0;
    v22 = 0;
    goto LABEL_8;
  }
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v26 = self;
  v16 = 0xF000000000000000;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;

  if (!a6)
    goto LABEL_7;
LABEL_4:
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v22 = v21;

LABEL_8:
  sub_100008A58((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v19);
  sub_1000093D8((uint64_t)v8, v16);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC14bluetoothuserd23ApplePushServiceManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100008E60(a4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_pushServiceQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_subscriptions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_subscriptionQueue));
  swift_bridgeObjectRelease(*(_QWORD *)&self->pushServiceQueue[OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_pushEnvironment]);

}

@end
