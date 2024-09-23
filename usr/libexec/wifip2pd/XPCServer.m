@implementation XPCServer

- (_TtC12wifip2pdCore9XPCServer)init
{
  _TtC12wifip2pdCore9XPCServer *result;

  result = (_TtC12wifip2pdCore9XPCServer *)_swift_stdlib_reportUnimplementedInitializer("wifip2pdCore.XPCServer", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_bridgeObjectRelease(*(_QWORD *)&self->listener[OBJC_IVAR____TtC12wifip2pdCore9XPCServer_entitlement]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_lock));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_gracePeriodEndedTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_pendingSessions));
  swift_bridgeObjectRelease(*(_QWORD *)&self->listener[OBJC_IVAR____TtC12wifip2pdCore9XPCServer_lastProcessName]);
  v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionGracePeriod;
  v4 = type metadata accessor for DispatchTimeInterval(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100012318(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionHandler), *(_QWORD *)&self->listener[OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionHandler]);
  v5 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_serverStartedTime;
  v6 = type metadata accessor for DispatchTime(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_logger;
  v8 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC12wifip2pdCore9XPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100300B34(v6, v7);

  return v9 & 1;
}

- (void)endpointForType:(unint64_t)a3 processName:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC12wifip2pdCore9XPCServer *v12;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  _Block_copy(v8);
  v12 = self;
  sub_1003017C0(a3, v9, v11, (uint64_t)v12, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

@end
