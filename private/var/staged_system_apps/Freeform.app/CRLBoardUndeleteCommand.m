@implementation CRLBoardUndeleteCommand

- (id)userFacingCommandName
{
  void *v3;
  _TtC8Freeform23CRLBoardUndeleteCommand *v4;
  id v5;
  NSString v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v7, v8);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v11 = v10;

  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v12;
}

- (_TtC8Freeform23CRLBoardUndeleteCommand)init
{
  _TtC8Freeform23CRLBoardUndeleteCommand *result;

  result = (_TtC8Freeform23CRLBoardUndeleteCommand *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardUndeleteCommand", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform23CRLBoardUndeleteCommand_boardIdentifiers));
}

@end
