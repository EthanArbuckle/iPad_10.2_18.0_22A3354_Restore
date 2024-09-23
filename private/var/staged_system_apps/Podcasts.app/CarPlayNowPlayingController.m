@implementation CarPlayNowPlayingController

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC8Podcasts27CarPlayNowPlayingController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = self;
  sub_1002A3A38();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[CarPlayNowPlayingController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_playbackItemDidChangeSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_playbackController));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_episodeController, (uint64_t *)&unk_10055FF30);
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_storeDataProvider, &qword_100565940);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_subscriptions));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplatePlayerPeriodicUpdateCallback), *(_QWORD *)&self->analyticsChannel[OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplatePlayerPeriodicUpdateCallback]);
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplateAlbumArtistButtonTappedCallback), *(_QWORD *)&self->analyticsChannel[OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplateAlbumArtistButtonTappedCallback]);
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplateUpNextButtonTappedCallback), *(_QWORD *)&self->analyticsChannel[OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplateUpNextButtonTappedCallback]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController____lazy_storage___playbackRateButton));
}

- (void)nowPlayingItemDidChange
{
  _TtC8Podcasts27CarPlayNowPlayingController *v2;

  v2 = self;
  sub_1002A407C();

}

- (void)playerPeriodicUpdate
{
  _TtC8Podcasts27CarPlayNowPlayingController *v2;

  v2 = self;
  sub_1002A4648();

}

- (void)manifestContentsDidChange
{
  _TtC8Podcasts27CarPlayNowPlayingController *v2;

  v2 = self;
  sub_1002A4238();

}

- (_TtC8Podcasts27CarPlayNowPlayingController)init
{
  return (_TtC8Podcasts27CarPlayNowPlayingController *)sub_1002A4A98((uint64_t)self, (uint64_t)a2);
}

- (void)nowPlayingTemplateAlbumArtistButtonTapped:(id)a3
{
  id v4;
  _TtC8Podcasts27CarPlayNowPlayingController *v5;

  v4 = a3;
  v5 = self;
  sub_1002AA134();

}

- (void)nowPlayingTemplateUpNextButtonTapped:(id)a3
{
  id v4;
  _TtC8Podcasts27CarPlayNowPlayingController *v5;

  v4 = a3;
  v5 = self;
  sub_1002AAA54();

}

@end
