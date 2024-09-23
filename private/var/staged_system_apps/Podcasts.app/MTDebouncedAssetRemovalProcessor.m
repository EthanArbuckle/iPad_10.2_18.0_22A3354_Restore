@implementation MTDebouncedAssetRemovalProcessor

- (BOOL)start
{
  MTDebouncedAssetRemovalProcessor *v2;
  id v3;
  _BYTE *v4;
  _BYTE v6[24];

  v2 = self;
  v3 = sub_100006944();
  dispatch thunk of DebouncedEpisodeAndShowProcessor.start()();
  swift_release(v3);
  v4 = (char *)v2 + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning;
  swift_beginAccess((char *)v2 + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning, v6, 1, 0);
  *v4 = 1;

  return 1;
}

- (BOOL)isRunning
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning;
  swift_beginAccess((char *)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning, v4, 0, 0);
  return *v2;
}

+ (MTDebouncedAssetRemovalProcessor)sharedInstance
{
  if (qword_100552010 != -1)
    swift_once(&qword_100552010, sub_10000E640);
  return (MTDebouncedAssetRemovalProcessor *)(id)static DebouncedAssetRemovalProcessor.sharedInstance;
}

- (void)setIsRunning:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning;
  swift_beginAccess((char *)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning, v5, 1, 0);
  *v4 = a3;
}

- (MTDebouncedAssetRemovalProcessor)init
{
  MTDebouncedAssetRemovalProcessor *result;

  result = (MTDebouncedAssetRemovalProcessor *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.DebouncedAssetRemovalProcessor", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_10004AD80((uint64_t)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor____lazy_storage___episodeStorage);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___MTDebouncedAssetRemovalProcessor____lazy_storage___debouncedProcessor));
}

@end
