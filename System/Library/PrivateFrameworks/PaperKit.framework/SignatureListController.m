@implementation SignatureListController

- (_TtC8PaperKit23SignatureListController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _TtC8PaperKit23SignatureListController *v12;
  objc_super v14;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    v9 = a4;
    v10 = (void *)MEMORY[0x1DF0E41AC](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = a4;
    v10 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SignatureListController();
  v12 = -[SignatureListController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, v10, a4);

  return v12;
}

- (_TtC8PaperKit23SignatureListController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SignatureListController();
  return -[SignatureListController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
