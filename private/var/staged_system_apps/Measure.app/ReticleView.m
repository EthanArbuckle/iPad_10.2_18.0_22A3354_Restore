@implementation ReticleView

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView__state);
}

- (void)setState:(int64_t)a3
{
  _TtC7Measure11ReticleView *v4;

  v4 = self;
  sub_100172548(a3);

}

- (float)currentDiameter
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_currentDiameter);
}

- (void)setCurrentDiameter:(float)a3
{
  *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_currentDiameter) = a3;
}

- (_TtC7Measure15ReticleAnimator)animator
{
  return (_TtC7Measure15ReticleAnimator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC7Measure11ReticleView_animator));
}

- (void)setAnimator:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_animator);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_animator) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure11ReticleView)initWithFrame:(CGRect)a3
{
  _TtC7Measure11ReticleView *result;

  sub_100172910(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7Measure11ReticleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10017559C();
}

- (void)updateForCurrentOrientation
{
  void *v3;
  id v4;
  id v5;
  _TtC7Measure11ReticleView *v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v6 = self;
  v4 = objc_msgSend(v3, "currentDevice");
  v5 = objc_msgSend(v4, "orientation");

  sub_100172728((unint64_t)v5);
}

- (void).cxx_destruct
{

  sub_1000C21E4((uint64_t)self + OBJC_IVAR____TtC7Measure11ReticleView_snapTimestamp);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure11ReticleView_animatingProperties));

}

@end
