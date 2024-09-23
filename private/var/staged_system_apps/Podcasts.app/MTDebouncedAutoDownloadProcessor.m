@implementation MTDebouncedAutoDownloadProcessor

- (BOOL)start
{
  MTDebouncedAutoDownloadProcessor *v2;
  id v3;
  _BYTE *v4;
  _BYTE v6[24];

  v2 = self;
  v3 = sub_1000055E8();
  dispatch thunk of DebouncedEpisodeAndShowProcessor.start()();
  swift_release(v3);
  v4 = (char *)v2 + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning;
  swift_beginAccess((char *)v2 + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning, v6, 1, 0);
  *v4 = 1;

  return 1;
}

- (BOOL)isRunning
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning;
  swift_beginAccess((char *)self + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning, v4, 0, 0);
  return *v2;
}

+ (MTDebouncedAutoDownloadProcessor)sharedInstance
{
  if (qword_1005520E0 != -1)
    swift_once(&qword_1005520E0, sub_10000E4D4);
  return (MTDebouncedAutoDownloadProcessor *)(id)static DebouncedAutoDownloadProcessor.sharedInstance;
}

- (void)setIsRunning:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning;
  swift_beginAccess((char *)self + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning, v5, 1, 0);
  *v4 = a3;
}

- (MTDebouncedAutoDownloadProcessor)init
{
  MTDebouncedAutoDownloadProcessor *result;

  result = (MTDebouncedAutoDownloadProcessor *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.DebouncedAutoDownloadProcessor", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___MTDebouncedAutoDownloadProcessor____lazy_storage___debouncedProcessor));

}

@end
