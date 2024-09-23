@implementation MPMessageID

- (NSString)stringValue
{
  MPMessageID *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10004781C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSUUID)messageUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class isa;
  uint64_t v16;

  v3 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10001283C(&qword_1000A2670);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100048B54((uint64_t)self + OBJC_IVAR___MPMessageID_value, (uint64_t)v6);
  LODWORD(v3) = swift_getEnumCaseMultiPayload(v6, v3);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((_DWORD)v3 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v6, v11);
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v13, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return (NSUUID *)0;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  return (NSUUID *)isa;
}

- (NSString)description
{
  MPMessageID *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10004781C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (MPMessageID)initWithValue:(unint64_t)a3
{
  char *v4;
  uint64_t v5;
  objc_super v7;

  v4 = (char *)self + OBJC_IVAR___MPMessageID_value;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPMessageID_value) = (Class)a3;
  v5 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v4, v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MessageID(0);
  return -[MPMessageID init](&v7, "init");
}

- (MPMessageID)initWithUuid:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  objc_class *v12;
  MPMessageID *v13;
  objc_super v15;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = (char *)self + OBJC_IVAR___MPMessageID_value;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR___MPMessageID_value, v9, v5);
  v11 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v10, v11, 1);
  v12 = (objc_class *)type metadata accessor for MessageID(0);
  v15.receiver = self;
  v15.super_class = v12;
  v13 = -[MPMessageID init](&v15, "init");
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v13;
}

- (MPMessageID)init
{
  MPMessageID *result;

  result = (MPMessageID *)_swift_stdlib_reportUnimplementedInitializer("FaceTime.MessageID", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004811C((uint64_t)self + OBJC_IVAR___MPMessageID_value);
}

- (int64_t)hash
{
  MPMessageID *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_100047384();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MPMessageID *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MPMessageID *v9;
  char v10;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100047DBC((uint64_t)v12, v8);

  sub_10001287C((uint64_t)v12, &qword_1000A2AB0);
  return v10 & 1;
}

@end
