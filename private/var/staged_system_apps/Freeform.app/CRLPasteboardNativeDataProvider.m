@implementation CRLPasteboardNativeDataProvider

- (NSArray)promisedDataTypes
{
  _TtC8Freeform31CRLPasteboardNativeDataProvider *v2;
  Class isa;

  v2 = self;
  sub_1009F3A40();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)fulfillPromisesForPasteboardType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform31CRLPasteboardNativeDataProvider *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_1009F40F4(v4, v6);
  v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1004BE2FC(v8, v10);
  }
  return isa;
}

- (_TtC8Freeform31CRLPasteboardNativeDataProvider)init
{
  _TtC8Freeform31CRLPasteboardNativeDataProvider *result;

  result = (_TtC8Freeform31CRLPasteboardNativeDataProvider *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardNativeDataProvider", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_pasteboardDataManaging));
  sub_1004BBBC8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_metadataData), *(_QWORD *)&self->pasteboardDataManaging[OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_metadataData]);
  sub_1004BBBC8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_objectsData), *(_QWORD *)&self->pasteboardDataManaging[OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_objectsData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
