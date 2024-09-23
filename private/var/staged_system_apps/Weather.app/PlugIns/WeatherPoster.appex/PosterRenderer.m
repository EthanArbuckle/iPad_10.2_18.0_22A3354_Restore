@implementation PosterRenderer

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6;
  _TtC13WeatherPoster14PosterRenderer *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100013FD8();

  swift_unknownObjectRelease(a4);
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8;
  id v9;
  _TtC13WeatherPoster14PosterRenderer *v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  v10 = self;
  sub_100015A84(v8, a4, a5);

  swift_unknownObjectRelease(a4);
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4;
  _TtC13WeatherPoster14PosterRenderer *v5;

  v4 = a3;
  v5 = self;
  sub_100015DC0();

}

- (_TtC13WeatherPoster14PosterRenderer)init
{
  sub_100015FEC();
}

- (void).cxx_destruct
{

  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData, (uint64_t *)&unk_10005C4B0);
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastRenderedAnimationViewModel, &qword_10005C320);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation));
  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_labelManager);

  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderingSessionManager);
  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unloadManager);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_rotationManager));
}

@end
