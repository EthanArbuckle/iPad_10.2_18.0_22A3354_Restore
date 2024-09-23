@implementation DownloadingEpisodeStateDataSource

- (_TtC8Podcasts33DownloadingEpisodeStateDataSource)init
{
  _TtC8Podcasts33DownloadingEpisodeStateDataSource *result;

  result = (_TtC8Podcasts33DownloadingEpisodeStateDataSource *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.DownloadingEpisodeStateDataSource", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_expectedEpisodeStates));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_downloadsNotifier));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_refreshControllerStates), *(_QWORD *)&self->expectedEpisodeStates[OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_refreshControllerStates]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_accessQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_downloadManagerObserver));
}

@end
