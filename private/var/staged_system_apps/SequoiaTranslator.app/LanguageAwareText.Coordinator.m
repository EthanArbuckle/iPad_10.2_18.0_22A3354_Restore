@implementation LanguageAwareText.Coordinator

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCV17SequoiaTranslator17LanguageAwareText11Coordinator *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1000F9478(v8, v9);

  return v12;
}

- (void)textView:(id)a3 textItemMenuWillDisplayForTextItem:(id)a4 animator:(id)a5
{
  sub_1000F7CBC(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t))sub_1000FA1DC);
}

- (void)textView:(id)a3 textItemMenuWillEndForTextItem:(id)a4 animator:(id)a5
{
  sub_1000F7CBC(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t))sub_1000FA718);
}

- (_TtCV17SequoiaTranslator17LanguageAwareText11Coordinator)init
{
  _TtCV17SequoiaTranslator17LanguageAwareText11Coordinator *result;

  result = (_TtCV17SequoiaTranslator17LanguageAwareText11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.Coordinator", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F943C((uint64_t)self + OBJC_IVAR____TtCV17SequoiaTranslator17LanguageAwareText11Coordinator_languageAwareText);
}

@end
