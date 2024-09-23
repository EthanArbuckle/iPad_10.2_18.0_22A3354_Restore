@implementation CRLSetBoardTitleCommand

- (NSString)boardTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->boardTitle[OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_boardTitle];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSString)previousBoardTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->boardTitle[OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_previousBoardTitle];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->boardTitle[OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_previousBoardTitle]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setPreviousBoardTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_previousBoardTitle);
  v7 = *(_QWORD *)&self->boardTitle[OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_previousBoardTitle];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (id)userFacingCommandName
{
  void *v3;
  _TtC8Freeform23CRLSetBoardTitleCommand *v4;
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

- (_TtC8Freeform23CRLSetBoardTitleCommand)init
{
  _TtC8Freeform23CRLSetBoardTitleCommand *result;

  result = (_TtC8Freeform23CRLSetBoardTitleCommand *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSetBoardTitleCommand", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_boardIdentifier, type metadata accessor for CRLBoardIdentifier);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
