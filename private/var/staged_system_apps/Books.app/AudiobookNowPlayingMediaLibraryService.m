@implementation AudiobookNowPlayingMediaLibraryService

- (_TtC5Books38AudiobookNowPlayingMediaLibraryService)init
{
  _TtC5Books38AudiobookNowPlayingMediaLibraryService *result;

  result = (_TtC5Books38AudiobookNowPlayingMediaLibraryService *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingMediaLibraryService", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_audiobook));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_helperProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_audiobookControls));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_persistenceController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_optionsStoreIDKey]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books38AudiobookNowPlayingMediaLibraryService_helper));
}

@end
