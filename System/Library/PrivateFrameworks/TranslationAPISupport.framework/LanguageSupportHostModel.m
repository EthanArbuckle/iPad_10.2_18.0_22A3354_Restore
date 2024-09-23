@implementation LanguageSupportHostModel

- (void)didFinishWithFinalConfiguration:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  _TtC21TranslationAPISupport24LanguageSupportHostModel *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_2491B3CAC(a3, a4);

}

- (BOOL)shouldAcceptWithConnection:(id)a3
{
  id v4;
  _TtC21TranslationAPISupport24LanguageSupportHostModel *v5;

  v4 = a3;
  v5 = self;
  sub_2491B4798(v4);

  return 1;
}

- (_TtC21TranslationAPISupport24LanguageSupportHostModel)init
{
  _TtC21TranslationAPISupport24LanguageSupportHostModel *result;

  result = (_TtC21TranslationAPISupport24LanguageSupportHostModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration));
  sub_2491B32D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion));
  sub_2491B3378((uint64_t)self + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration, &qword_257853680);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection));
  v3 = (char *)self + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel___observationRegistrar;
  v4 = sub_2491B6C14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
