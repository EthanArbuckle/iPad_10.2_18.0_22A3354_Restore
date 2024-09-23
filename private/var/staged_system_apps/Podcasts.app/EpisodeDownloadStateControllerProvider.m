@implementation EpisodeDownloadStateControllerProvider

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return (MTLegacyDownloadManagerProtocol *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadManager));
}

- (void)setDownloadManager:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadManager);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadManager) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (_TtC8Podcasts38EpisodeDownloadStateControllerProvider)init
{
  _TtC8Podcasts38EpisodeDownloadStateControllerProvider *result;

  result = (_TtC8Podcasts38EpisodeDownloadStateControllerProvider *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.EpisodeDownloadStateControllerProvider", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_stateController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadingStateDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadsNotifier));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadManager));
}

@end
