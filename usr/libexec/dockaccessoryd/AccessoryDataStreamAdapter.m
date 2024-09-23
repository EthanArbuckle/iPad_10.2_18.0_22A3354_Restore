@implementation AccessoryDataStreamAdapter

- (_TtC14dockaccessoryd26AccessoryDataStreamAdapter)init
{
  _TtC14dockaccessoryd26AccessoryDataStreamAdapter *result;

  result = (_TtC14dockaccessoryd26AccessoryDataStreamAdapter *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.AccessoryDataStreamAdapter", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_weakDestroy((char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_accessory);
  sub_10009B2C0((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_delegate, (uint64_t *)&unk_10026D798);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_metadata));
  swift_bridgeObjectRelease(*(_QWORD *)&self->accessory[OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_reason]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_currentBulkSendSession));
  sub_1000B1410(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_pendingOpenSessionCallback), *(_QWORD *)&self->accessory[OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_pendingOpenSessionCallback]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->accessory[OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_fileType]);
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
  _TtC14dockaccessoryd26AccessoryDataStreamAdapter *v7;
  _QWORD v8[4];

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v8);
  swift_unknownObjectRelease(a3);
  objc_msgSend(a4, "rejectBulkSendSessionWithStatus:", 1);
  swift_unknownObjectRelease(a4);

  sub_100090E88(v8);
}

- (void)accessoryDidStartListening:(id)a3
{
  _TtC14dockaccessoryd26AccessoryDataStreamAdapter *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_1000E4C08((uint64_t)v6);

  sub_100090E88(v6);
}

- (void)accessoryDidCloseDataStream:(id)a3
{
  _TtC14dockaccessoryd26AccessoryDataStreamAdapter *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);

  swift_unknownObjectRelease(a3);
  sub_100090E88(v6);
}

@end
