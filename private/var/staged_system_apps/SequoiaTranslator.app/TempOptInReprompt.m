@implementation TempOptInReprompt

- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC17SequoiaTranslator17TempOptInReprompt *)sub_10018786C();
}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  _TtC17SequoiaTranslator17TempOptInReprompt *v5;
  NSString v6;
  id v7;
  uint64_t v8;
  Class isa;

  v3 = sub_100006DF4((uint64_t *)&unk_10028C060);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1001EA980;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v6, 0, "continueButtonPressed");

  *(_QWORD *)(v4 + 32) = v7;
  specialized Array._endMutation()(v8);

  sub_100187FA8();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)continueButtonPressed
{
  _TtC17SequoiaTranslator17TempOptInReprompt *v2;

  v2 = self;
  sub_100187D68();

}

- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC17SequoiaTranslator17TempOptInReprompt *result;

  result = (_TtC17SequoiaTranslator17TempOptInReprompt *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.TempOptInReprompt", 35, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC17SequoiaTranslator17TempOptInReprompt *result;

  v6 = a5;
  result = (_TtC17SequoiaTranslator17TempOptInReprompt *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.TempOptInReprompt", 35, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100011194((uint64_t)&self->OBTextWelcomeController_opaque[OBJC_IVAR____TtC17SequoiaTranslator17TempOptInReprompt_delegate]);
}

@end
