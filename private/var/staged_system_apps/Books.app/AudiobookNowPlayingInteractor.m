@implementation AudiobookNowPlayingInteractor

- (REBuyBookServiceDelegate)serviceDelegate
{
  return (REBuyBookServiceDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_serviceDelegate, a3);
}

- (_TtC5Books29AudiobookNowPlayingInteractor)init
{
  _TtC5Books29AudiobookNowPlayingInteractor *result;

  result = (_TtC5Books29AudiobookNowPlayingInteractor *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingInteractor", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_delegate);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_externalDelegates));
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_currentChapter);
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_navigationHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_storeManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_transferLockController));

  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_lastUserProgressChangeTimestamp, &qword_1009D7440);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_subscribers));
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_buyButtonPresenter, (uint64_t *)&unk_1009D7450);

  v3 = (char *)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_serviceDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor____lazy_storage___playbackRates));
}

- (BOOL)isStore
{
  return 1;
}

- (BOOL)isLocal
{
  return *(unsigned __int16 *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_assetState) == 1;
}

- (BOOL)isDownloading
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_downloadState) == (Class)1;
}

- (BOOL)isCloud
{
  return 0;
}

- (BOOL)isSample
{
  return 1;
}

- (BOOL)isAudiobook
{
  return 1;
}

- (BOOL)isPreordered
{
  _QWORD *v3;
  _TtC5Books29AudiobookNowPlayingInteractor *v4;
  _BYTE v6[24];

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager, v6, 0, 0);
  sub_10003F198(v3, v3[3]);
  v4 = self;
  LOBYTE(v3) = sub_1003F6408();

  return v3 & 1;
}

- (void)buyBookWithCompletion:(id)a3
{
  void *v4;
  _TtC5Books29AudiobookNowPlayingInteractor *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1002A8F48((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

@end
