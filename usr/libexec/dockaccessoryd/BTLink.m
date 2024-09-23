@implementation BTLink

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC14dockaccessoryd6BTLink *v5;

  v4 = a3;
  v5 = self;
  sub_10011DE38(v4);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC14dockaccessoryd6BTLink *v14;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_100121234(v12, v10, v13);

  swift_bridgeObjectRelease(v10);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd6BTLink *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10011E45C(v6, v7);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14dockaccessoryd6BTLink *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_100121948(v9, (uint64_t)a5);

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14dockaccessoryd6BTLink *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10011EEBC(v8, v9, a5);

}

- (_TtC14dockaccessoryd6BTLink)init
{
  return (_TtC14dockaccessoryd6BTLink *)sub_1001A30A8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd6BTLink_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd6BTLink_powerOnActions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd6BTLink_btScan));
  sub_10009B2C0((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd6BTLink_filter, (uint64_t *)&unk_10026E6D0);
  sub_1000B1410(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd6BTLink_match), *(_QWORD *)&self->manager[OBJC_IVAR____TtC14dockaccessoryd6BTLink_match]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd6BTLink_connectionTxn));

  sub_10009B2C0((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd6BTLink_delegate, (uint64_t *)&unk_10026E690);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd6BTLink__discoveredLock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd6BTLink__discoveredDevices));
}

@end
