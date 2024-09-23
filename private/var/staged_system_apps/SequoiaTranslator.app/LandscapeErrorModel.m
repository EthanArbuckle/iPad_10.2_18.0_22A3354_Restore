@implementation LandscapeErrorModel

- (_TtC17SequoiaTranslator19LandscapeErrorModel)init
{
  _TtC17SequoiaTranslator19LandscapeErrorModel *result;

  result = (_TtC17SequoiaTranslator19LandscapeErrorModel *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.LandscapeErrorModel", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19LandscapeErrorModel__errorShowing;
  v4 = sub_100006DF4((uint64_t *)&unk_1002987F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator19LandscapeErrorModel_subscription));
  swift_bridgeObjectRelease(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC17SequoiaTranslator19LandscapeErrorModel_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC17SequoiaTranslator19LandscapeErrorModel_message]);
}

@end
