@implementation MoveFileOperation

- (_TtC8Podcasts17MoveFileOperation)init
{
  _TtC8Podcasts17MoveFileOperation *result;

  result = (_TtC8Podcasts17MoveFileOperation *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.MoveFileOperation", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  sub_10003A858(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_input]);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_destination;
  v4 = type metadata accessor for URL(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_source, v4);

}

@end
