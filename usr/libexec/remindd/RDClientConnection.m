@implementation RDClientConnection

- (void)dealloc
{
  _TtC7remindd18RDClientConnection *v2;
  objc_super v3;

  v2 = self;
  sub_1000082FC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for RDClientConnection();
  -[RDClientConnection dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd18RDClientConnection_delegate);
  sub_1000178E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity], *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 8], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 8], *(unsigned int *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 16] | ((unint64_t)*(unsigned __int16 *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 20] << 32));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDClientConnection_xpcDaemon));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd18RDClientConnection_notificationSubscriptionQueue));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd18RDClientConnection_keepAliveTransaction));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd18RDClientConnection_cancellables));
}

- (void)storePerformerWithProcessName:(id)a3 storeContainerToken:(id)a4 reason:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC7remindd18RDClientConnection *v17;
  _BYTE v18[16];
  uint64_t (*v19)();
  uint64_t v20;

  v10 = _Block_copy(a6);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;
  v15 = swift_allocObject(&unk_1007F3B40, 24, 7);
  *(_QWORD *)(v15 + 16) = v10;
  v19 = sub_100009434;
  v20 = v15;
  v16 = a4;
  v17 = self;
  sub_1000092FC((void (*)(uint64_t *, id))sub_10000940C, (uint64_t)v18, (void (*)(uint64_t *__return_ptr))sub_1000094A8);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v14);
  swift_release(v15);
}

- (NSString)description
{
  _TtC7remindd18RDClientConnection *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10001797C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC7remindd18RDClientConnection)init
{
  _TtC7remindd18RDClientConnection *result;

  result = (_TtC7remindd18RDClientConnection *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDClientConnection", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)changeTrackingPerformerWithStoreContainerToken:(id)a3 reason:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _TtC7remindd18RDClientConnection *v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = swift_allocObject(&unk_1007F3B90, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = a3;
  v14 = self;
  sub_10041F050((uint64_t)a3, v9, v11);

  swift_bridgeObjectRelease();
  swift_release(v12);
}

- (void)debugPerformerWithStoreContainerToken:(id)a3 reason:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC7remindd18RDClientConnection *v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[48];

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = swift_allocObject(&unk_1007F3B68, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = qword_1008371A8;
  v14 = a3;
  v15 = self;
  if (v13 != -1)
    swift_once(&qword_1008371A8, sub_1003201E8);
  sub_1000184A8((uint64_t)v15 + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity, (uint64_t)v20);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  sub_10001B228((uint64_t)v20, 0x2E6775626564, 0xE600000000000000);
  swift_bridgeObjectRelease();
  __chkstk_darwin(v17);
  __chkstk_darwin(v18);
  sub_1000092FC((void (*)(uint64_t *, id))sub_100009410, v19, (void (*)(uint64_t *__return_ptr))sub_1004212EC);

  swift_bridgeObjectRelease();
  swift_release(v12);

}

- (void)syncInterfacePerformerWithReason:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7remindd18RDClientConnection *v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[48];

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1007F3B18, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = qword_1008371A8;
  v12 = self;
  if (v11 != -1)
    swift_once(&qword_1008371A8, sub_1003201E8);
  sub_1000184A8((uint64_t)v12 + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity, (uint64_t)v17);
  v13._countAndFlagsBits = v7;
  v13._object = v9;
  String.append(_:)(v13);
  sub_10001B228((uint64_t)v17, 0x2E636E7973, 0xE500000000000000);
  swift_bridgeObjectRelease();
  __chkstk_darwin(v14);
  __chkstk_darwin(v15);
  sub_1000092FC((void (*)(uint64_t *, id))sub_10000940C, v16, (void (*)(uint64_t *__return_ptr))sub_1004212D4);

  swift_bridgeObjectRelease();
  swift_release(v10);
}

- (void)indexingPerformerWithReason:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7remindd18RDClientConnection *v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[48];

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1007F3AF0, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = qword_1008371A8;
  v12 = self;
  if (v11 != -1)
    swift_once(&qword_1008371A8, sub_1003201E8);
  sub_1000184A8((uint64_t)v12 + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity, (uint64_t)v17);
  v13._countAndFlagsBits = v7;
  v13._object = v9;
  String.append(_:)(v13);
  sub_10001B228((uint64_t)v17, 0x676E697865646E69, 0xE90000000000002ELL);
  swift_bridgeObjectRelease();
  __chkstk_darwin(v14);
  __chkstk_darwin(v15);
  sub_1000092FC((void (*)(uint64_t *, id))sub_10000940C, v16, (void (*)(uint64_t *__return_ptr))sub_100420348);

  swift_bridgeObjectRelease();
  swift_release(v10);
}

- (void)cloudKitNetworkActivityDidUpdate:(id)a3
{
  id v4;
  _TtC7remindd18RDClientConnection *v5;

  v4 = a3;
  v5 = self;
  sub_10041FC9C((uint64_t)v4);

}

@end
