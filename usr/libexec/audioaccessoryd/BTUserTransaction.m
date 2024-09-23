@implementation BTUserTransaction

- (void)dealloc
{
  BTUserTransaction.__deallocating_deinit((uint64_t)self);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_name]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_underlyingTransaction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_underlyingActivity));
}

- (_TtC15audioaccessoryd17BTUserTransaction)init
{
  _TtC15audioaccessoryd17BTUserTransaction *result;

  result = (_TtC15audioaccessoryd17BTUserTransaction *)_swift_stdlib_reportUnimplementedInitializer("audioaccessoryd.BTUserTransaction", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  _TtC15audioaccessoryd17BTUserTransaction *v5;
  uint64_t v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  unint64_t v10;
  NSString v11;
  _QWORD v13[3];
  unint64_t v14;

  v13[2] = 0x3A4E58545BLL;
  v14 = 0xE500000000000000;
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_name);
  v3 = *(_QWORD *)&self->name[OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_name];
  v13[0] = v4;
  v13[1] = v3;
  swift_bridgeObjectRetain(v3);
  v5 = self;
  v6 = sub_1000A0980(&qword_100211AB0);
  v7._countAndFlagsBits = String.init<A>(describing:)(v13, v6);
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9._countAndFlagsBits = 93;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  v10 = v14;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

@end
