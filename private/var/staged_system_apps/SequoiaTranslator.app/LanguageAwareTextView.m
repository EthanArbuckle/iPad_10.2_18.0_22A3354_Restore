@implementation LanguageAwareTextView

- (NSLocale)locale
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_100006DF4((uint64_t *)&unk_10028FE50);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale;
  swift_beginAccess(v6, v12, 0, 0);
  sub_100082758((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for Locale(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Locale._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSLocale *)isa;
}

- (void)setLocale:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC17SequoiaTranslator21LanguageAwareTextView *v14;
  _BYTE v15[24];
  _BYTE v16[24];

  v5 = sub_100006DF4((uint64_t *)&unk_10028FE50);
  v6 = __chkstk_darwin(v5);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v10 = &v15[-v9];
  if (a3)
  {
    static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = type metadata accessor for Locale(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for Locale(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale, v16, 0, 0);
  sub_100082758((uint64_t)v13, (uint64_t)v8);
  swift_beginAccess(v13, v15, 33, 0);
  v14 = self;
  sub_1000F6D38((uint64_t)v10, (uint64_t)v13);
  swift_endAccess(v15);
  sub_1000FB024((uint64_t)v8);
  sub_10000A020((uint64_t)v10, (uint64_t *)&unk_10028FE50);
  sub_10000A020((uint64_t)v8, (uint64_t *)&unk_10028FE50);

}

- (_TtC17SequoiaTranslator21LanguageAwareTextView)init
{
  return (_TtC17SequoiaTranslator21LanguageAwareTextView *)sub_1000FB390();
}

- (_TtC17SequoiaTranslator21LanguageAwareTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000FC44C();
}

- (NSArray)_additionalTextInputLocales
{
  _TtC17SequoiaTranslator21LanguageAwareTextView *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1000FB6B4();

  if (v3)
  {
    type metadata accessor for Locale(0);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (UITextInputMode)textInputMode
{
  _TtC17SequoiaTranslator21LanguageAwareTextView *v2;
  id v3;

  v2 = self;
  v3 = sub_1000FB848();

  return (UITextInputMode *)v3;
}

- (void)reloadInputViews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for LanguageAwareTextView(0);
  -[LanguageAwareTextView reloadInputViews](&v2, "reloadInputViews");
}

- (BOOL)resignFirstResponder
{
  void (*v3)(_TtC17SequoiaTranslator21LanguageAwareTextView *);
  uint64_t v4;
  _TtC17SequoiaTranslator21LanguageAwareTextView *v5;
  _TtC17SequoiaTranslator21LanguageAwareTextView *v6;
  BOOL v7;
  objc_super v9;

  v3 = *(void (**)(_TtC17SequoiaTranslator21LanguageAwareTextView *))((char *)&self->super.super.super.super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_willResignFirstResponder);
  if (v3)
  {
    v4 = *(_QWORD *)&self->super.super.highlightDelegate[OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_willResignFirstResponder];
    v5 = self;
    sub_100016244((uint64_t)v3, v4);
    v3(v5);
    sub_10002BA44((uint64_t)v3, v4);
  }
  else
  {
    v6 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LanguageAwareTextView(0);
  v7 = -[LanguageAwareTextView resignFirstResponder](&v9, "resignFirstResponder");

  return v7;
}

- (void)textViewTapped:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator21LanguageAwareTextView *v5;

  v4 = a3;
  v5 = self;
  sub_1000FC084(v4);

}

- (_TtC17SequoiaTranslator21LanguageAwareTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator21LanguageAwareTextView *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator21LanguageAwareTextView *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.LanguageAwareTextView", 39, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002BA44(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_willResignFirstResponder), *(_QWORD *)&self->super.super.highlightDelegate[OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_willResignFirstResponder]);
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_languageAwareTextViewDelegate);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale, (uint64_t *)&unk_10028FE50);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.highlightDelegate[OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_placeholderLocalizableKey]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_inputModeBeforeReloadWithoutLocaleChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView____lazy_storage___tapGestureRecognizer));
}

@end
