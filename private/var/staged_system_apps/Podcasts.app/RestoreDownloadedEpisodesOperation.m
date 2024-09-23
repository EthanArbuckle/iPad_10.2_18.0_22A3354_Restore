@implementation RestoreDownloadedEpisodesOperation

- (_TtC8Podcasts34RestoreDownloadedEpisodesOperation)init
{
  _TtC8Podcasts34RestoreDownloadedEpisodesOperation *result;

  result = (_TtC8Podcasts34RestoreDownloadedEpisodesOperation *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.RestoreDownloadedEpisodesOperation", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100045978(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Podcasts34RestoreDownloadedEpisodesOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts34RestoreDownloadedEpisodesOperation_input]);
  sub_10003D380((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8Podcasts34RestoreDownloadedEpisodesOperation_mediaLibrary));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts34RestoreDownloadedEpisodesOperation_episodeStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts34RestoreDownloadedEpisodesOperation_downloadsManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts34RestoreDownloadedEpisodesOperation____lazy_storage___serialQueue));
}

@end
