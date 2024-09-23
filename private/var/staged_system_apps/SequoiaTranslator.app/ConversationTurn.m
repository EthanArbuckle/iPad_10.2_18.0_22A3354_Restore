@implementation ConversationTurn

- (_TtC17SequoiaTranslator16ConversationTurn)init
{
  _TtC17SequoiaTranslator16ConversationTurn *result;

  result = (_TtC17SequoiaTranslator16ConversationTurn *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.ConversationTurn", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_10002BA44(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator16ConversationTurn_completion), *(_QWORD *)&self->request[OBJC_IVAR____TtC17SequoiaTranslator16ConversationTurn_completion]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator16ConversationTurn_lid));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator16ConversationTurn_speech));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator16ConversationTurn_translation));
}

- (NSString)debugDescription
{
  _TtC17SequoiaTranslator16ConversationTurn *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100085C1C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end
