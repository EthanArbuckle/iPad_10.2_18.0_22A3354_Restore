@implementation URLWatcher.Presenter

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  sub_1B1791524(0, (unint64_t *)&qword_1ED4BF720, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v12 - v5;
  v7 = (char *)self + OBJC_IVAR____TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter_url;
  v8 = sub_1B2228110();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1B2228074();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return (NSURL *)v10;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_msgSend((id)objc_opt_self(), sel_mainQueue);
}

- (void)presentedItemDidChange
{
  _TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter *v2;

  v2 = self;
  sub_1B1FFF680();

}

- (_TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter)init
{
  _TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter *result;

  result = (_TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter_url;
  v4 = sub_1B2228110();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1B1B1DC9C((uint64_t)self + OBJC_IVAR____TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter_lastModificationDate, &qword_1EEF62090, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_weakDestroy();
}

@end
