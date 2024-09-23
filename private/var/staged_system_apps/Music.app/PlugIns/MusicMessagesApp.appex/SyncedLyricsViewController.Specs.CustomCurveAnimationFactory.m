@implementation SyncedLyricsViewController.Specs.CustomCurveAnimationFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  float v2;
  float v3;
  float v4;
  float v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint1);
  v3 = *(double *)&self->controlPoint1[OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint1];
  v4 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint2);
  v5 = *(double *)&self->controlPoint1[OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint2];
  v6 = objc_allocWithZone((Class)CAMediaTimingFunction);
  *(float *)&v7 = v2;
  *(float *)&v8 = v3;
  *(float *)&v9 = v4;
  *(float *)&v10 = v5;
  return objc_msgSend(v6, "initWithControlPoints::::", v7, v8, v9, v10);
}

- (_TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory)init
{
  _TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory *result;

  result = (_TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.CustomCurveAnimationFactory", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
