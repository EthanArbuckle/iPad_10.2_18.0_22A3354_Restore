@implementation SearchUIBasicAnimationSettings

- (double)duration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  return *v2;
}

- (void)setDuration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  *v4 = a3;
}

- (double)delay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
  swift_beginAccess();
  return *v2;
}

- (void)setDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
  swift_beginAccess();
  *v4 = a3;
}

- (CABasicAnimation)coreAnimation
{
  id v3;
  _TtC8SearchUI30SearchUIBasicAnimationSettings *v4;
  id v5;
  double *v6;

  v3 = objc_allocWithZone(MEMORY[0x1E0CD2710]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  v6 = (double *)((char *)v4 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  objc_msgSend(v5, sel_setDuration_, *v6);

  return (CABasicAnimation *)v5;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  double *v3;
  double v4;
  id v5;
  _TtC8SearchUI30SearchUIBasicAnimationSettings *v6;
  id v7;
  id v8;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  v4 = *v3;
  v5 = objc_allocWithZone(MEMORY[0x1E0DC36D8]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_initWithAnimationCurve_, 0);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F38]), sel_initWithDuration_timingParameters_, v7, v4);

  return (UIViewPropertyAnimator *)v8;
}

- (_TtC8SearchUI30SearchUIBasicAnimationSettings)init
{
  _TtC8SearchUI30SearchUIBasicAnimationSettings *result;

  result = (_TtC8SearchUI30SearchUIBasicAnimationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
