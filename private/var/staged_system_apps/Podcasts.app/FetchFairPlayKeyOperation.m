@implementation FetchFairPlayKeyOperation

- (_TtC8Podcasts25FetchFairPlayKeyOperation)init
{
  _TtC8Podcasts25FetchFairPlayKeyOperation *result;

  result = (_TtC8Podcasts25FetchFairPlayKeyOperation *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.FetchFairPlayKeyOperation", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10003A858(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_input]);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_episodeLocation;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_fairPlayKeyLoader));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.lock[OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation____lazy_storage___logPrefix]);
}

@end
