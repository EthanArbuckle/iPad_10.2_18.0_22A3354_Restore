@implementation AAProxCardsRecord

- (NSString)description
{
  _TtC15audioaccessoryd17AAProxCardsRecord *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  AAProxCardsRecord.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  _TtC15audioaccessoryd17AAProxCardsRecord *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = -[AAProxCardsRecord description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC15audioaccessoryd17AAProxCardsRecord)init
{
  _TtC15audioaccessoryd17AAProxCardsRecord *result;

  result = (_TtC15audioaccessoryd17AAProxCardsRecord *)_swift_stdlib_reportUnimplementedInitializer("audioaccessoryd.AAProxCardsRecord", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_1000A103C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata), *(_QWORD *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata]);
  v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_proxCardVersions));
  v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_lastModifiedDate;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
