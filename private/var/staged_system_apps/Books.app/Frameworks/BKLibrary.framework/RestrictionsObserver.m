@implementation RestrictionsObserver

- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v5 = sub_6A50C(&qword_DE428);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v9 = self;
  v10 = sub_6A50C((uint64_t *)&unk_DE430);
  AsyncStream.Continuation.yield(_:)(&v12, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (_TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver)init
{
  _TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver *result;

  result = (_TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver *)_swift_stdlib_reportUnimplementedInitializer("BKLibrary.RestrictionsObserver", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver_continuation;
  v3 = sub_6A50C((uint64_t *)&unk_DE430);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
