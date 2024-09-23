@implementation TextBoxTextView

- (_TtC8PaperKit15TextBoxTextView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC8PaperKit15TextBoxTextView *result;

  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit15TextBoxTextView_formAutofillDelegate;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = a3;

  result = (_TtC8PaperKit15TextBoxTextView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSUndoManager)undoManager
{
  _TtC8PaperKit15TextBoxTextView *v2;
  id v3;

  v2 = self;
  v3 = TextBoxTextView.undoManager.getter();

  return (NSUndoManager *)v3;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC8PaperKit15TextBoxTextView *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  TextBoxTextView.insertText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)insertTextSuggestion:(id)a3
{
  id v5;
  _TtC8PaperKit15TextBoxTextView *v6;

  v5 = a3;
  v6 = self;
  TextBoxTextView.insert(_:)(a3);

}

- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3
{
  _TtC8PaperKit15TextBoxTextView *v4;

  v4 = self;
  TextBoxTextView.autoFillDidInsert(withExplicitInvocationMode:)(a3);

}

- (NSArray)keyCommands
{
  _TtC8PaperKit15TextBoxTextView *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = TextBoxTextView.keyCommands.getter();

  if (v3)
  {
    type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIKeyCommand);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleTabWithSender:(id)a3
{
  @objc TextBoxTextView.handleTab(sender:)((char *)self, (uint64_t)a2, a3, 0);
}

- (void)handleBackTabWithSender:(id)a3
{
  @objc TextBoxTextView.handleTab(sender:)((char *)self, (uint64_t)a2, a3, 1);
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (_TtC8PaperKit15TextBoxTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC8PaperKit15TextBoxTextView *result;

  v4 = a4;
  result = (_TtC8PaperKit15TextBoxTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit15TextBoxTextView_formAutofillDelegate, &demangling cache variable for type metadata for FormAutofillDelegate?);
}

@end
