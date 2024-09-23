@implementation LegacyInlineTranslationTabErrorView

- (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView *)sub_1000FF4F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView *result;

  v5 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_errorType;
  *(_QWORD *)v5 = 0;
  v5[8] = -1;
  *(_QWORD *)&self->errorType[OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter] = 0;
  swift_unknownObjectWeakInit();
  v6 = a3;

  result = (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/LegacyInlineTranslationTabErrorView.swift", 59, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)onDeviceLinkTapped
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  _TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView *v9;

  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong);
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease(v5);
  }
}

- (void).cxx_destruct
{
  sub_1000E05B8(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_errorType), self->errorType[OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_errorType]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_button));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter);
}

@end
