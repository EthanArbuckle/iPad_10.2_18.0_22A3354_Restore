@implementation XPCSession

- (NSString)description
{
  _TtC12wifip2pdCore10XPCSession *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10000ED34();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (int64_t)hash
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_connection), "hash");
}

- (void)dealloc
{
  _TtC12wifip2pdCore10XPCSession *v2;

  v2 = self;
  sub_1002677EC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release(*(_QWORD *)&self->requestHandler[OBJC_IVAR____TtC12wifip2pdCore10XPCSession_requestHandler]);
  sub_100012318(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_invalidationHandler), *(_QWORD *)&self->requestHandler[OBJC_IVAR____TtC12wifip2pdCore10XPCSession_invalidationHandler]);
  v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_voucher));

  swift_bridgeObjectRelease(*(_QWORD *)&self->requestHandler[OBJC_IVAR____TtC12wifip2pdCore10XPCSession_processName]);
  v5 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_uuid;
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (_TtC12wifip2pdCore10XPCSession)init
{
  _TtC12wifip2pdCore10XPCSession *result;

  result = (_TtC12wifip2pdCore10XPCSession *)_swift_stdlib_reportUnimplementedInitializer("wifip2pdCore.XPCSession", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)createSubscribeWithConfiguration:(id)a3 completionHandler:(id)a4
{
  sub_100264AF8(self, (int)a2, a3, a4, (uint64_t)&unk_1003F44B8, (uint64_t)sub_10024BE40, (void (*)(id, uint64_t, uint64_t))sub_100268048);
}

- (void)createPublishWithConfiguration:(id)a3 completionHandler:(id)a4
{
  sub_1002681C0(self, (int)a2, a3, a4, (uint64_t)&unk_1003F4468, (uint64_t)sub_10024BE40, 1, (uint64_t)&unk_1003F4480);
}

- (void)createDatapathWithConfiguration:(id)a3 completionHandler:(id)a4
{
  sub_1002681C0(self, (int)a2, a3, a4, (uint64_t)&unk_1003F4418, (uint64_t)sub_10024BE40, 2, (uint64_t)&unk_1003F4430);
}

- (void)queryCurrentDeviceCapabilities:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F43C8, (uint64_t)sub_100269D2C, 3, (uint64_t)&unk_1003F43E0);
}

- (void)createXPCResponderWithType:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12wifip2pdCore10XPCSession *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1003F4378, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_1002682A4(a3, (uint64_t)sub_10024BE40, v7);

  swift_release(v7);
}

- (void)startMonitoringAWDLStateWithConfiguration:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, _TtC12wifip2pdCore10XPCSession *);
  id v10;
  _TtC12wifip2pdCore10XPCSession *v11;
  _QWORD v12[5];
  char v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1003F4350, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v12[0] = a3;
  v12[1] = sub_10024BE40;
  v12[3] = 0;
  v12[4] = 0;
  v12[2] = v7;
  v13 = 5;
  v9 = *(void (**)(_QWORD *, _TtC12wifip2pdCore10XPCSession *))((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_requestHandler);
  v8 = *(_QWORD *)&self->requestHandler[OBJC_IVAR____TtC12wifip2pdCore10XPCSession_requestHandler];
  v10 = a3;
  v11 = self;
  swift_retain(v8);
  v9(v12, v11);

  swift_release(v7);
  swift_release(v8);
}

- (void)queryAWDLState:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F4300, (uint64_t)sub_100013064, 6, (uint64_t)&unk_1003F4318);
}

- (void)queryAverageRSSIForAWDLPeer:(id)a3 completionHandler:(id)a4
{
  sub_100264AF8(self, (int)a2, a3, a4, (uint64_t)&unk_1003F42B0, (uint64_t)sub_100013064, (void (*)(id, uint64_t, uint64_t))sub_1002685D4);
}

- (void)queryPeersWithCompletionHandler:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F4260, (uint64_t)sub_100269C44, 8, (uint64_t)&unk_1003F4278);
}

- (void)queryAWDLStatisticsWithCompletionHandler:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F4210, (uint64_t)sub_100269BE4, 9, (uint64_t)&unk_1003F4228);
}

- (void)queryAWDLLowLatencyStatisticsWithCompletionHandler:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F41C0, (uint64_t)sub_100269BE4, 10, (uint64_t)&unk_1003F41D8);
}

- (void)updateAWDLLTERestrictedChannels:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12wifip2pdCore10XPCSession *v10;

  v6 = _Block_copy(a4);
  v7 = sub_1000644C8(0, (unint64_t *)&unk_100410200, WiFiChannel_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_1003F4170, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  sub_1002687F0(v8, (uint64_t)sub_10024BE40, v9);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (void)performRealtimeConnectivityCheckWithConfiguration:(id)a3 completionHandler:(id)a4
{
  sub_1002681C0(self, (int)a2, a3, a4, (uint64_t)&unk_1003F4120, (uint64_t)sub_100013064, 11, (uint64_t)&unk_1003F4138);
}

- (void)queryActiveServiceUniqueIdentifiersWithCompletionHandler:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F40D0, (uint64_t)sub_100269B9C, 12, (uint64_t)&unk_1003F40E8);
}

- (void)queryActiveServicesAndActivePortsWithCompletionHandler:(id)a3
{
  sub_10026854C(self, (int)a2, a3, (uint64_t)&unk_1003F4080, (uint64_t)sub_100269B70, 13, (uint64_t)&unk_1003F4098);
}

- (void)dump:(id)a3 to:(id)a4 maximumDepth:(int64_t)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC12wifip2pdCore10XPCSession *v14;

  v10 = _Block_copy(a6);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v12 = swift_allocObject(&unk_1003F4030, 24, 7);
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a4;
  v14 = self;
  sub_100268F44(v11, (uint64_t)v13, a5, (uint64_t)sub_10001305C, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

@end
