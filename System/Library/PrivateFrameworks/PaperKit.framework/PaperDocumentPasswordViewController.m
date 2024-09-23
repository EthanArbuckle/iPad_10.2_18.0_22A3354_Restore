@implementation PaperDocumentPasswordViewController

- (_TtC8PaperKit35PaperDocumentPasswordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8PaperKit35PaperDocumentPasswordViewController *)PaperDocumentPasswordViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit35PaperDocumentPasswordViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit35PaperDocumentPasswordViewController_documentToUnlock) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit35PaperDocumentPasswordViewController_assetToUnlock;
  v6 = type metadata accessor for CRAsset();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit35PaperDocumentPasswordViewController_contextForLockedDocument) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaperDocumentPasswordViewController(0);
  return -[PasswordViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit35PaperDocumentPasswordViewController_documentToUnlock));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit35PaperDocumentPasswordViewController_assetToUnlock, (uint64_t *)&demangling cache variable for type metadata for CRAsset?);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit35PaperDocumentPasswordViewController_contextForLockedDocument));
}

@end
