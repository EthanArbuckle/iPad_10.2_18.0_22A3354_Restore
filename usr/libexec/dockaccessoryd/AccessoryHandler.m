@implementation AccessoryHandler

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v8;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _TtC14dockaccessoryd16AccessoryHandler *v17;

  v8 = a6;
  if (a3)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v14 = v13;
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
  if (a6)
LABEL_3:
    v8 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v8, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  if (a7)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
    a7 = v16;
  }
  else
  {
    v15 = 0;
  }
  v17 = self;
  sub_10009B7C0(v12, v14, a4, a5, (uint64_t)v8, v15, (unint64_t)a7);

  swift_bridgeObjectRelease(a7);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v14);
}

- (void)accessoryConnectionDetached:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC14dockaccessoryd16AccessoryHandler *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_10009BD68(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)dealloc
{
  _TtC14dockaccessoryd16AccessoryHandler *v2;

  v2 = self;
  sub_10009C270();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->passedMFI4Auth[OBJC_IVAR____TtC14dockaccessoryd16AccessoryHandler_passedMFI4Auth]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->passedMFI4Auth[OBJC_IVAR____TtC14dockaccessoryd16AccessoryHandler_MFI4AccessoryDisconnected]);
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryHandler_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14dockaccessoryd16AccessoryHandler_connectionDelegate));
  swift_bridgeObjectRelease(*(_QWORD *)&self->passedMFI4Auth[OBJC_IVAR____TtC14dockaccessoryd16AccessoryHandler_currentInductiveConnectionUUID]);
}

- (_TtC14dockaccessoryd16AccessoryHandler)init
{
  return (_TtC14dockaccessoryd16AccessoryHandler *)sub_10009C590();
}

@end
