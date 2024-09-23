@implementation CRLBoardFavoriteCommand

- (BOOL)favorite
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLBoardFavoriteCommand_favorite);
}

- (id)userFacingCommandName
{
  _TtC8Freeform23CRLBoardFavoriteCommand *v2;
  NSString v3;

  v2 = self;
  sub_100BE5C90();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC8Freeform23CRLBoardFavoriteCommand)init
{
  _TtC8Freeform23CRLBoardFavoriteCommand *result;

  result = (_TtC8Freeform23CRLBoardFavoriteCommand *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardFavoriteCommand", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100BE88D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform23CRLBoardFavoriteCommand_boardIdentifiers, (void (*)(_QWORD))&_swift_bridgeObjectRelease, &OBJC_IVAR____TtC8Freeform23CRLBoardFavoriteCommand_initialState, &OBJC_IVAR____TtC8Freeform23CRLBoardFavoriteCommand_newState);
}

@end
