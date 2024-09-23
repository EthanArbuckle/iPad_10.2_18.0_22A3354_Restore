@implementation AccountsObserver

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  _TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver *v4;

  v4 = self;
  sub_7C850();

}

- (_TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver)init
{
  _TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver *result;

  result = (_TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver *)_swift_stdlib_reportUnimplementedInitializer("BKLibrary.AccountsObserver", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_6DEC8((uint64_t)self + OBJC_IVAR____TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver_provider);
  v3 = (char *)self + OBJC_IVAR____TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver_continuation;
  v4 = sub_6A50C((uint64_t *)&unk_DDEB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
