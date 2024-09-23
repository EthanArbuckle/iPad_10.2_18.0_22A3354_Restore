@implementation CentralManager

- (void)dealloc
{
  _TtC12searchpartyd14CentralManager *v2;

  v2 = self;
  sub_100E027F4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC12searchpartyd14CentralManager_name]);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_lock));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_stateChangedSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_peripheralDiscoveredSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_objectDiscoveredSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_connectionEventSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_companionLinkStates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_receiveSubjects));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_findMyPeripheralsSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_serviceIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_connectionEventServiceIdentifiers));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_garbageCollectTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_discovered));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_connectedPeripheralCache));

}

- (_TtC12searchpartyd14CentralManager)init
{
  _TtC12searchpartyd14CentralManager *result;

  result = (_TtC12searchpartyd14CentralManager *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.CentralManager", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC12searchpartyd14CentralManager *v5;

  v4 = a3;
  v5 = self;
  sub_100E0BB00(v4);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC12searchpartyd14CentralManager *v14;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_100E110C4(v12, v10, v13);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC12searchpartyd14CentralManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100E11BF0(v7);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  sub_10078AFE8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_100E12594);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  sub_10078AFE8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_100E12B2C);
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;
  _TtC12searchpartyd14CentralManager *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_100E133D8((char *)a4, v9);

}

- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC12searchpartyd14CentralManager *v9;

  v7 = sub_10000F4A0(0, (unint64_t *)&unk_1011217C0, CBPeripheral_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v8 = a3;
  v9 = self;
  Lock.callAsFunction<A>(_:)(sub_100E14C48);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC12searchpartyd14CentralManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100E13AA0(v7);

}

- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC12searchpartyd14CentralManager *v13;
  id v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  v13 = self;
  sub_100E13FD0(v11, v12);

}

- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC12searchpartyd14CentralManager *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;

  sub_100E146D0(v11, v13, v10);
  sub_10001BC14(v11, v13);

}

@end
