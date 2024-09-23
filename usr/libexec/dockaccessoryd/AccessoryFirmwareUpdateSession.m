@implementation AccessoryFirmwareUpdateSession

- (void)dealloc
{
  void *v3;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_socket);
  v4 = self;
  if (v3)
    objc_msgSend(v3, "close");
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccessoryFirmwareUpdateSession(0);
  -[AccessoryFirmwareUpdateSession dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_accessory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_uarpAccessory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_manager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_workQueue));
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_txn));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_socket));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_socketLock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_socketIdleTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_assetID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_stagedAssetID));
  sub_1000B98AC((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_msgFeedback);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_profile));
}

- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateSession)init
{
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *result;

  result = (_TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.AccessoryFirmwareUpdateSession", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000B38B0(v6, v7);

}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;

  sub_1000B5108(v7, v10, v12);
  sub_10009B2FC(v10, v12);
  return 1;
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v12;

  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1000B8D8C(a5, a6);

}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1000B5850(v8, v9, a5);

}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v7;

  v6 = a3;
  v7 = self;
  sub_1000B6BA4(v6, a4);

}

- (void)socketDidClose:(id)a3
{
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000B914C();
  swift_unknownObjectRelease(a3);

}

- (void)socket:(id)a3 didFailWithError:(id)a4
{
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v7;
  id v8;

  swift_unknownObjectRetain(a3);
  v8 = a4;
  v7 = self;
  sub_1000B9374((uint64_t)v8);
  swift_unknownObjectRelease(a3);

}

- (void)socketDidReceiveData:(id)a3
{
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000B7C60((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *v5;

  v4 = a3;
  v5 = self;
  sub_1000B95AC();

}

@end
