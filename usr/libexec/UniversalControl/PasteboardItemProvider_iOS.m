@implementation PasteboardItemProvider_iOS

- (_TtC13EnsembleAgent26PasteboardItemProvider_iOS)init
{
  sub_100020064();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_weakDestroy((char *)self + OBJC_IVAR____TtC13EnsembleAgent26PasteboardItemProvider_iOS_dataSession);
  v3 = (char *)self + OBJC_IVAR____TtC13EnsembleAgent26PasteboardItemProvider_iOS_logger;
  v4 = sub_10000F6E4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
