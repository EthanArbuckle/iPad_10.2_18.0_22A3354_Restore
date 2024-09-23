@implementation BonjourAdvertiser

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser)init
{
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser *result;

  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser *)_swift_stdlib_reportUnimplementedInitializer("CoreP2P.BonjourAdvertiser", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100031E9C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service), *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service+ 8], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service+ 16]);
  sub_100031E0C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo), *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 8], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 16], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 24], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 32], *(_QWORD *)&self->txtInfo[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 6]);
  sub_100033A84((uint64_t)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_srvInfo, &qword_100404B80);
}

@end
