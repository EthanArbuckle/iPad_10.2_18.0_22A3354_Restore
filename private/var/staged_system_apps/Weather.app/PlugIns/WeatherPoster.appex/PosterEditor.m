@implementation PosterEditor

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6;
  _TtC13WeatherPoster12PosterEditor *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100033254(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8;
  id v9;
  _TtC13WeatherPoster12PosterEditor *v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  v10 = self;
  sub_1000337E8((uint64_t)v10, (uint64_t)a4, a5);

  swift_unknownObjectRelease(a4);
}

- (id)looksForEditor:(id)a3
{
  id v4;
  _TtC13WeatherPoster12PosterEditor *v5;
  uint64_t v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_100033A54();

  sub_1000135E0(0, (unint64_t *)&unk_10005D3F0, PREditingLook_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (id)titleContentStylePickerConfigurationForEditor:(id)a3
{
  id v4;
  _TtC13WeatherPoster12PosterEditor *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100033C74();

  return v6;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8;
  id v9;
  _TtC13WeatherPoster12PosterEditor *v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  v10 = self;
  sub_100033DAC((uint64_t)v10, a4);

  swift_unknownObjectRelease(a4);
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC13WeatherPoster12PosterEditor *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100034A24(v7, (uint64_t)v8, (void (**)(_QWORD))v6);
  _Block_release(v6);

}

- (void)editorDidInvalidate:(id)a3
{
  id v4;
  _TtC13WeatherPoster12PosterEditor *v5;

  v4 = a3;
  v5 = self;
  sub_100034C98();

}

- (_TtC13WeatherPoster12PosterEditor)init
{
  sub_1000354A0();
}

- (void).cxx_destruct
{

  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData, (uint64_t *)&unk_10005C4B0);
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_lastRenderedAnimationViewModel, &qword_10005C320);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_animation));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_labelManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_rotationManager));
}

@end
