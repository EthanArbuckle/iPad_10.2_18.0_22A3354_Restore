@implementation RDJSONCoder

- (_TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder)init
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v6;
  objc_super v8;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_key);
  *v3 = 0;
  v3[1] = 0;
  v4 = sub_10001A630((uint64_t *)&unk_10083D630);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1006A3C00;
  v6 = self;
  *(_QWORD *)(v5 + 32) = sub_10016E7E4((uint64_t)_swiftEmptyArrayStorage);
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_dicts) = (Class)v5;
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_arrays) = (Class)_swiftEmptyArrayStorage;

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for RDJSONCoder();
  return -[RDJSONCoder init](&v8, "init");
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v9;

  v4 = a3;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = self;
  sub_100167340(v4, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v9;

  v4 = *(_QWORD *)&a3;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = self;
  sub_1001674A0(v4, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = self;
  sub_100167600(a3, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = self;
  sub_100167760(v5, v7);

  swift_bridgeObjectRelease(v7);
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v7;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v8;
  uint64_t v9;
  id v10;
  _TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD v15[2];

  if (a3)
  {
    v7 = a4;
    v8 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v15, v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v10 = a4;
    v11 = self;
  }
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;

  sub_100167B80((uint64_t)v15, v12, v14);
  swift_bridgeObjectRelease(v14);
  sub_10000882C((uint64_t)v15, (uint64_t *)&unk_10083D5B0);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_dicts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_arrays));
  swift_bridgeObjectRelease(*(_QWORD *)&self->dicts[OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_key]);
}

@end
