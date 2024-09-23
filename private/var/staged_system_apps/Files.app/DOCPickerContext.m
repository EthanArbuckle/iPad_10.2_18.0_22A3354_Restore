@implementation DOCPickerContext

- (_TtC5Files16DOCPickerContext)init
{
  _TtC5Files16DOCPickerContext *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC5Files16DOCPickerContext *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003ELL, 0x8000000100511D50, "Files/DOCPickerContext.swift", 28, 2, 52, 0);
  __break(1u);
  return result;
}

- (_TtC5Files16DOCPickerContext)initWithURLs:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_10004F2F0(0, &qword_100644C20, FPSandboxingURLWrapper_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (_TtC5Files16DOCPickerContext *)DOCPickerContext.init(with:)(v5);
}

- (_TtC5Files16DOCPickerContext)initWithItems:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  objc_super v8;

  v5 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_itemsToMove) = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCPickerContext();
  return -[DOCPickerContext init](&v8, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_urlsToSave));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_utisToSave));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_itemsToMove));
}

@end
