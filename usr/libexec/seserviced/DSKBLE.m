@implementation DSKBLE

- (_TtC10seserviced6DSKBLE)init
{
  return (_TtC10seserviced6DSKBLE *)sub_1000B26C4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced6DSKBLE_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced6DSKBLE_closuresOnPowerOn));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced6DSKBLE_connectedPeripherals));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced6DSKBLE_connectionRequests));
  swift_bridgeObjectRelease(*(_QWORD *)&self->centralManager[OBJC_IVAR____TtC10seserviced6DSKBLE_discoveryEventName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced6DSKBLE_discoveryPairedPeripherals));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced6DSKBLE_discoveryTransactions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced6DSKBLE_scanRequests));
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC10seserviced6DSKBLE *v5;

  v4 = a3;
  v5 = self;
  sub_1000BBEBC(v4);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC10seserviced6DSKBLE *v14;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_1000DD984(v12, v10, v13);

  swift_bridgeObjectRelease(v10);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  _QWORD *v7;
  _TtC10seserviced6DSKBLE *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000DF320(v7);

}

- (void)centralManager:(id)a3 didUpdateControllerBTClockDictForPeripheral:(id)a4 results:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC10seserviced6DSKBLE *v11;

  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1000E03D0(v10, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)centralManager:(id)a3 didUpdateRSSIStatisticsDetectionForPeripheral:(id)a4 results:(id)a5 error:(id)a6
{
  uint64_t v10;
  id v11;
  uint8_t *v12;
  _TtC10seserviced6DSKBLE *v13;
  id v14;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v11 = a3;
  v12 = (uint8_t *)a4;
  v13 = self;
  v14 = a6;
  sub_1000E0C18(v12, v10, (uint64_t)a6);

  swift_bridgeObjectRelease(v10);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  sub_1000BCAF8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000E23F0);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  sub_1000BCAF8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000E2DCC);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC10seserviced6DSKBLE *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1000BCB78(v6, (uint64_t)a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  sub_1000C1C28(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_1000BD9EC);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_1000C1C28(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_1000BEB3C);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_1000C1C28(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_1000C050C);
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC10seserviced6DSKBLE *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1000C1CAC(v8, a4, (uint64_t)a5);

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  char v4;
  id v6;
  _TtC10seserviced6DSKBLE *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1000C2450(v6, v4);

}

@end
