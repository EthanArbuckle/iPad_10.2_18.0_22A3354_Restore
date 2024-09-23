@implementation TestSession

- (NSString)description
{
  return (NSString *)sub_100051C88(self, (uint64_t)a2, sub_1000510E8);
}

- (RPRemoteDisplayDevice)destinationDevice
{
  id v2;

  sub_1000511CC();
  return (RPRemoteDisplayDevice *)v2;
}

- (void)setDestinationDevice:(id)a3
{
  id v5;
  _TtC12SidecarRelay11TestSession *v6;

  v5 = a3;
  v6 = self;

}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC12SidecarRelay11TestSession *v13;
  uint64_t v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = swift_allocObject(&unk_100087D60, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = self;
  sub_100051238(v9, v11, v14, (uint64_t)sub_100053200, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
  swift_bridgeObjectRelease(a4);
}

- (void)deregisterEventID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12SidecarRelay11TestSession *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100051444(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _TtC12SidecarRelay11TestSession *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v12 = (void (*)(void))_Block_copy(a7);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  if (a6)
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (v12)
  {
    v18 = swift_allocObject(&unk_100087D38, 24, 7);
    *(_QWORD *)(v18 + 16) = v12;
    v12 = (void (*)(void))sub_100012CAC;
  }
  else
  {
    v18 = 0;
  }
  v19 = self;
  sub_100051500((uint64_t)v19, v20, v21, v22, v23, v24, v12);
  sub_1000121B4((uint64_t)v12, v18);

  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(a6);
}

- (void)activateWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  _TtC12SidecarRelay11TestSession *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_100087CC0, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100012CAC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100051E18((uint64_t)v7, v6, (uint64_t)&unk_100087CE8, (uint64_t)sub_100053124, (uint64_t)&unk_100087D00);
  sub_1000121B4((uint64_t)v7, v6);

}

- (void)invalidate
{
  _TtC12SidecarRelay11TestSession *v2;

  v2 = self;
  sub_10005175C();

}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = swift_allocObject(&unk_100087C48, 24, 7);
  *(_QWORD *)(v10 + 16) = v7;
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(a4);
  swift_release(v10);
}

- (void)deregisterRequestID:(id)a3
{
  uint64_t v3;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_bridgeObjectRelease(v3);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _TtC12SidecarRelay11TestSession *v20;

  v12 = _Block_copy(a7);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;
  if (a6)
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  _Block_copy(v12);
  v20 = self;
  sub_1000519C0(v13, v15, v16, v17, v19, (uint64_t)a6, (uint64_t)v20, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12);
  _Block_release(v12);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(a6);
}

- (_TtC12SidecarRelay11TestSession)init
{
  sub_100051B9C();
}

- (void).cxx_destruct
{

  sub_1000536AC(*(_QWORD *)&self->RPRemoteDisplaySession_opaque[OBJC_IVAR____TtC12SidecarRelay11TestSession_handlers]);
}

@end
