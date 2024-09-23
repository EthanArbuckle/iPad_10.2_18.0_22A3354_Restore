@implementation ECPrimitiveCreator

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  objc_class *v11;
  uint64_t v15;
  uint64_t v16;
  _TtC7Metrics18ECPrimitiveCreator *v17;

  v11 = (objc_class *)a5;
  if (a5)
  {
    v15 = sub_100008A18(&qword_1002654D0);
    v11 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for String, v15, &protocol witness table for String);
  }
  if (a6)
  {
    v16 = sub_100008A18((uint64_t *)&unk_1002659F0);
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for String, v16, &protocol witness table for String);
  }
  v17 = self;
  sub_100136E20(a3, a4, v11, (uint64_t)a6, a7, a8);

  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(v11);
}

- (_TtC7Metrics18ECPrimitiveCreator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ECPrimitiveCreator();
  return -[ECPrimitiveCreator init](&v3, "init");
}

@end
