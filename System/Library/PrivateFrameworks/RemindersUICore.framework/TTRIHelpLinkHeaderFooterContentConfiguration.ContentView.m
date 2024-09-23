@implementation TTRIHelpLinkHeaderFooterContentConfiguration.ContentView

- (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView)initWithCoder:(id)a3
{
  id v4;
  _TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView_textViewConstraints) = 0;
  v4 = a3;

  result = (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *v12;
  uint64_t v14;

  v7 = sub_1B49036D4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B490368C();
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1B48FCAB8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView)initWithFrame:(CGRect)a3
{
  _TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *result;

  result = (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self+ OBJC_IVAR____TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView_textView));
  swift_bridgeObjectRelease();
}

@end
