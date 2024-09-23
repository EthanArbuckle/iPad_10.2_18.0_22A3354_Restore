@implementation TranslateInputCard

- (UITextInputMode)textInputMode
{
  void *v3;
  _TtC17SequoiaTranslator18TranslateInputCard *v4;
  void *v5;
  void *v6;
  _TtC17SequoiaTranslator18TranslateInputCard *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _TtC17SequoiaTranslator18TranslateInputCard *v11;
  id v12;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_inputModeBeforeReturnKeyChange);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_opt_self(UITextInputMode);
    v7 = self;
    v8 = objc_msgSend(v6, "activeInputModes");
    v9 = sub_10000A05C(0, &qword_100292578, UITextInputMode_ptr);
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

    v11 = v7;
    v5 = sub_10019E344(v10, (uint64_t)v11);
    swift_bridgeObjectRelease();

  }
  v12 = v3;

  return (UITextInputMode *)v5;
}

- (_TtC17SequoiaTranslator18TranslateInputCard)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator18TranslateInputCard *)sub_10019CAA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  _TtC17SequoiaTranslator18TranslateInputCard *v5;
  NSString v6;
  id v7;
  uint64_t v8;
  Class isa;

  v3 = sub_100006DF4((uint64_t *)&unk_10028C060);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1001EA980;
  static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyInputEscape);
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v6, 0, "closeButtonPressed");

  *(_QWORD *)(v4 + 32) = v7;
  specialized Array._endMutation()(v8);

  sub_10000A05C(0, (unint64_t *)&qword_100297A40, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (_TtC17SequoiaTranslator18TranslateInputCard)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10019E464();
}

- (void)closeButtonPressed
{
  uint64_t Strong;
  void *v4;
  _TtC17SequoiaTranslator18TranslateInputCard *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "closePressed");

    swift_unknownObjectRelease(v4);
  }
}

- (void)selectedSegmentChanged
{
  _TtC17SequoiaTranslator18TranslateInputCard *v2;

  v2 = self;
  sub_10019DB3C();

}

- (void).cxx_destruct
{
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_textInputTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard____lazy_storage___textInput));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard____lazy_storage___editOrSpeakHint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_inputModeBeforeReturnKeyChange));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_editingPair));
  sub_1000A8C7C((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_selectedEditingLocale);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_instrumentation));
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_uiVisible);
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator18TranslateInputCard *v5;

  v4 = a3;
  v5 = self;
  sub_10019E5C4();

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator18TranslateInputCard *v5;

  v4 = a3;
  v5 = self;
  sub_10019DF70(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC17SequoiaTranslator18TranslateInputCard *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_10019E698(v10, v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)pasted:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _TtC17SequoiaTranslator18TranslateInputCard *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  char *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_instrumentation);
  v8 = self;
  v13 = v7;
  v9 = String.count.getter(v4, v6);
  v10 = *(_QWORD *)&v13[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount];
  v11 = __OFADD__(v10, v9);
  v12 = v10 + v9;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v13[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount] = v12;

    swift_bridgeObjectRelease(v6);
  }
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  uint64_t Strong;
  void *v8;
  id v9;
  _TtC17SequoiaTranslator18TranslateInputCard *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_delegate);
  if (Strong)
  {
    v8 = (void *)Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    objc_msgSend(v8, "willBeginEditing");

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
}

@end
