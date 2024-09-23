@implementation DOCQLItemsPreviewController

- (_TtC5Files27DOCQLItemsPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC5Files27DOCQLItemsPreviewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Files27DOCQLItemsPreviewController__nonSourceBasedQLItems) = (Class)_swiftEmptyArrayStorage;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Files27DOCQLItemsPreviewController__nonSourceBasedQLItems) = (Class)_swiftEmptyArrayStorage;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCQLItemsPreviewController();
  v11 = -[DOCQLItemsPreviewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC5Files27DOCQLItemsPreviewController)initWithCoder:(id)a3
{
  _TtC5Files27DOCQLItemsPreviewController *result;

  result = (_TtC5Files27DOCQLItemsPreviewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCPreviewController.swift", 32, 2, 118, 0);
  __break(1u);
  return result;
}

- (_TtC5Files27DOCQLItemsPreviewController)initWithPreviewItems:(id)a3
{
  _TtC5Files27DOCQLItemsPreviewController *result;

  result = (_TtC5Files27DOCQLItemsPreviewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCQLItemsPreviewController", 33, "init(previewItems:)", 19, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files27DOCQLItemsPreviewController__nonSourceBasedQLItems));
}

@end
