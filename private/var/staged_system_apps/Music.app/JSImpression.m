@implementation JSImpression

- (NSString)debugDescription
{
  char *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  void *object;
  uint64_t v12;
  NSString v13;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  v3 = -[JSImpression debugDescription](&v15, "debugDescription");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v16 = v4;
  v17 = v6;
  v7._countAndFlagsBits = 10;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC11MusicJSCore12JSImpression_fields];
  v9 = swift_bridgeObjectRetain();
  v10._countAndFlagsBits = Dictionary.description.getter(v9, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  object = v10._object;
  String.append(_:)(v10);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(object);
  v12 = v17;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return (NSString *)v13;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore12JSImpression_fields));
}

@end
