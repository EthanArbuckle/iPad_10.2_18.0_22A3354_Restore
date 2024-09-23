@implementation BTDevice

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC14dockaccessoryd8BTDevice *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1000E0258(v6, (uint64_t)a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14dockaccessoryd8BTDevice *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1000E04BC(v8, v9, (uint64_t)a5);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_1000E0DBC(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000E190C);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_1000E0DBC(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000E1A1C);
}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
  id v5;
  id v6;

  if (!a5)
  {
    v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_rssi);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_rssi) = (Class)a4;
    v5 = a4;

  }
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  objc_msgSend(a3, "canSendWriteWithoutResponse");
}

- (_TtC14dockaccessoryd8BTDevice)init
{
  _TtC14dockaccessoryd8BTDevice *result;

  result = (_TtC14dockaccessoryd8BTDevice *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.BTDevice", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000E1AC8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext), *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 8], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 16], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 24], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 32], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 40], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 48], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 56], *(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext + 64]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_deviceName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_connectOnActions));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_advData));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_delegate));

  v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_id;
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
