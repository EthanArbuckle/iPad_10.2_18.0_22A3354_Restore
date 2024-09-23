@implementation AccessoryFirmwareUpdateManager

- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateManager)init
{
  return (_TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *)sub_1001264A0();
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100127C2C(v6, v7);

}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *v9;
  uint64_t v10;
  uint8_t *v11;
  uint8_t *v12;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;

  sub_100128798(v7, v10, v12);
  sub_10009B2FC(v10, (unint64_t)v12);
  return 1;
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *v12;

  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100128D3C(v10, (uint64_t)v11, (NSObject **)a5, (char *)a6);

}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100129060(v8, (uint64_t)v9, a5);

}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  _TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *v7;

  v6 = a3;
  v7 = self;
  sub_100129380(v6, a4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_uarpController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_registeredAccessories));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_activeSessions));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_sessionLock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_reachabilityTimer));
}

@end
