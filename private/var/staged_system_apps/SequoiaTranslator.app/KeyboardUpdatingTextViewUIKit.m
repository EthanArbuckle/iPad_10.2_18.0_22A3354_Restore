@implementation KeyboardUpdatingTextViewUIKit

- (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit)initWithCoder:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_textTranslationLocaleSubscription) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_allowKeyboardLocaleChange) = 1;
  v4 = a3;

  result = (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/KeyboardUpdatingTextView.swift", 48, 2, 35, 0);
  __break(1u);
  return result;
}

- (NSArray)_additionalTextInputLocales
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  _TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *v13;
  uint64_t v14;
  uint64_t v15;
  Class isa;

  v3 = sub_100006DF4((uint64_t *)&unk_100292580);
  v4 = *(_QWORD *)(type metadata accessor for Locale(0) - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 32) & ~v6;
  v8 = swift_allocObject(v3, v7 + 2 * v5, v6 | 7);
  *(_OWORD *)(v8 + 16) = xmmword_1001E4D60;
  v9 = (_QWORD *)(v8 + v7);
  v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_conversation);
  KeyPath = swift_getKeyPath(&unk_1001EF0F8);
  v12 = swift_getKeyPath(&unk_1001EF120);
  v13 = self;
  static Published.subscript.getter(v9, v10, KeyPath);
  swift_release(KeyPath);
  swift_release(v12);
  v14 = swift_getKeyPath(&unk_1001EF140);
  v15 = swift_getKeyPath(&unk_1001EF168);
  static Published.subscript.getter((_QWORD *)((char *)v9 + v5), v10, v14);

  swift_release(v14);
  swift_release(v15);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

- (UITextInputMode)textInputMode
{
  void *v3;
  _TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *v8;
  void *v9;
  objc_super v11;

  if (*((_BYTE *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_allowKeyboardLocaleChange) == 1)
  {
    v3 = (void *)objc_opt_self(UITextInputMode);
    v4 = self;
    v5 = objc_msgSend(v3, "activeInputModes");
    v6 = sub_10000A05C(0, &qword_100292578, UITextInputMode_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

    v8 = v4;
    v9 = sub_1000F1C10(v7, (uint64_t)v8);
    swift_bridgeObjectRelease(v7);

    return (UITextInputMode *)v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)type metadata accessor for KeyboardUpdatingTextViewUIKit();
    return -[KeyboardUpdatingTextViewUIKit textInputMode](&v11, "textInputMode");
  }
}

- (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.KeyboardUpdatingTextViewUIKit", 47, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_conversation));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_textTranslationLocaleSubscription));
}

@end
