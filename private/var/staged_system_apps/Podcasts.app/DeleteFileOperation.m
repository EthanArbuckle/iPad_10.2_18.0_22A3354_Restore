@implementation DeleteFileOperation

- (_TtC8Podcasts19DeleteFileOperation)init
{
  _TtC8Podcasts19DeleteFileOperation *result;

  result = (_TtC8Podcasts19DeleteFileOperation *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.DeleteFileOperation", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10003A858(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts19DeleteFileOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts19DeleteFileOperation_input]);

  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts19DeleteFileOperation_file;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
