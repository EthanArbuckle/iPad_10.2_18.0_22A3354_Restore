@implementation Peripheral

- (void)dealloc
{
  uint64_t v2;
  _TtC12searchpartyd10Peripheral *v3;
  uint64_t v4;
  objc_super v5;

  v2 = qword_1010EA648;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1010EA648, sub_100E00F3C);
  v4 = type metadata accessor for Logger(0);
  sub_10001A9E8(v4, (uint64_t)qword_1011B8590);
  sub_1007885B0(0x74696E696564, 0xE600000000000000);
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for Peripheral(0);
  -[Peripheral dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC12searchpartyd10Peripheral_lastSeen;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001D8A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_connectionPromise), *(_QWORD *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_connectionPromise]);
  sub_10001D8A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_disconnectionPromise), *(_QWORD *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_disconnectionPromise]);
  sub_10001D8A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_servicesPromise), *(_QWORD *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_servicesPromise]);
  sub_10001D8A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_sendDataPromise), *(_QWORD *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_sendDataPromise]);
  sub_100004048((uint64_t)self + OBJC_IVAR____TtC12searchpartyd10Peripheral_findMyIdentifier, &qword_1010ED860);
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC12searchpartyd10Peripheral *v2;
  NSString v3;

  v2 = self;
  sub_100787F28();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC12searchpartyd10Peripheral)init
{
  _TtC12searchpartyd10Peripheral *result;

  result = (_TtC12searchpartyd10Peripheral *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.Peripheral", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC12searchpartyd10Peripheral *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100789A28(v6, (uint64_t)a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  sub_10078AFE8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_10078B984);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_10078AFE8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_10078BDD4);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_10078AFE8(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_10078C518);
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC12searchpartyd10Peripheral *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10078CF90(v9);

}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  id v4;
  _TtC12searchpartyd10Peripheral *v5;

  v4 = a3;
  v5 = self;
  sub_10078D920(v4);

}

@end
