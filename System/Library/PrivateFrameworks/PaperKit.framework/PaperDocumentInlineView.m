@implementation PaperDocumentInlineView

- (void)layoutSubviews
{
  _TtC8PaperKit23PaperDocumentInlineView *v2;

  v2 = self;
  PaperDocumentInlineView.layoutSubviews()();

}

- (_TtC8PaperKit23PaperDocumentInlineView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized PaperDocumentInlineView.init(coder:)();
}

- (void)didMoveToWindow
{
  _TtC8PaperKit23PaperDocumentInlineView *v2;

  v2 = self;
  PaperDocumentInlineView.didMoveToWindow()();

}

- (void)toolPickerWillShow:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8PaperKit23PaperDocumentInlineView *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  PaperDocumentInlineView.toolPickerWillShow(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC8PaperKit23PaperDocumentInlineView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit23PaperDocumentInlineView *result;

  result = (_TtC8PaperKit23PaperDocumentInlineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_toolPicker));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_crContext));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_paperDocumentView));
  swift_unknownObjectWeakDestroy();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_temporaryPaperDocument, (uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>?);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_textualContextProvider);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_magicGenerativePlaygroundTokenProvider, &demangling cache variable for type metadata for MagicGenerativePlaygroundTokenProvider?);
}

@end
