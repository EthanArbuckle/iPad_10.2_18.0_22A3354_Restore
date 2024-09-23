@implementation MessagingServiceDelegateTrampoline

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v27;

  v9 = a5;
  if (!a5)
  {
    v23 = a3;
    v24 = a4;
    v25 = a6;
    v26 = a7;
    v27 = self;
    v19 = 0xF000000000000000;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    v22 = 0;
    goto LABEL_6;
  }
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = self;
  v17 = v9;
  v9 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v19 = v18;

  if (!a6)
    goto LABEL_5;
LABEL_3:
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v22 = v21;

LABEL_6:
  sub_1002E6680((char *)a3, a4, (uint64_t)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_10001EF3C((uint64_t)v9, v19);

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v24;
  id v25;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v26;
  uint64_t v27;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v28;

  v28 = self;
  v14 = sub_10001A9A8(&qword_1010FBA40);
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v17 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    v18 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  if (a6)
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (a7)
  {
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
    a7 = v20;
  }
  else
  {
    v19 = 0;
  }
  v21 = a3;
  v22 = a4;
  v23 = a8;
  v24 = v28;
  v25 = a8;
  v26 = v24;
  sub_1002E7424((unint64_t)a3, a4, (uint64_t)v16, a6, v19, (uint64_t)a7, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100004048((uint64_t)v16, &qword_1010FBA40);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v18;

  v8 = a6;
  if (a5)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_1002E82CC((uint64_t)a3, a4, v12, v14, v8, (char *)a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v8;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v19;
  uint64_t v20;
  id v21;
  id v22;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v23;
  _OWORD v24[2];

  v8 = a6;
  if (a5)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v14 = v13;
    if (v8)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (a7)
      goto LABEL_4;
LABEL_7:
    memset(v24, 0, sizeof(v24));
    v21 = a3;
    v22 = a4;
    v23 = self;
    goto LABEL_8;
  }
  v12 = 0;
  v14 = 0;
  if (!a6)
    goto LABEL_6;
LABEL_3:
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v8 = v16;
  if (!a7)
    goto LABEL_7;
LABEL_4:
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = swift_unknownObjectRetain(a7);
  _bridgeAnyObjectToAny(_:)(v24, v20);
  swift_unknownObjectRelease(a7);
LABEL_8:
  sub_1002E8CC8((uint64_t)a3, a4, v12, v14, v15, (uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100004048((uint64_t)v24, (uint64_t *)&unk_1010F6390);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v8;

  if (a4)
    v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_1002E986C((uint64_t)a3, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  sub_1002EA8B4(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t))sub_1002E9EBC);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  sub_1002EA8B4(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t))sub_1002EA3B8);
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v19;
  unint64_t v20;
  unint64_t v21;
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *v22;

  if (a6)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (a7)
  {
    v18 = a7;
    v19 = self;
    a7 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a7);
    v21 = v20;

  }
  else
  {
    v22 = self;
    v21 = 0xF000000000000000;
  }
  sub_1002EAB80(v16, v17, v12, v14, (uint64_t)a7, v21);
  sub_10001EF3C((uint64_t)a7, v21);

  swift_bridgeObjectRelease();
}

- (_TtC12searchpartyd34MessagingServiceDelegateTrampoline)init
{
  _TtC12searchpartyd34MessagingServiceDelegateTrampoline *result;

  result = (_TtC12searchpartyd34MessagingServiceDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.MessagingServiceDelegateTrampoline", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002EB2D8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd34MessagingServiceDelegateTrampoline_delegate);
}

@end
