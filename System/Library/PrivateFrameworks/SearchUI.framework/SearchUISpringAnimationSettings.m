@implementation SearchUISpringAnimationSettings

+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonSelection
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FD96F0068DB8BACLL;
  v5.receiver = v3;
  v5.super_class = v2;
  return (_TtC8SearchUI31SearchUISpringAnimationSettings *)objc_msgSendSuper2(&v5, sel_init);
}

+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonSelectionCancel
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FE06A7EF9DB22D1;
  v5.receiver = v3;
  v5.super_class = v2;
  return (_TtC8SearchUI31SearchUISpringAnimationSettings *)objc_msgSendSuper2(&v5, sel_init);
}

+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonIconAppear
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FDC6F694467381DLL;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FDE147AE147AE14;
  v5.receiver = v3;
  v5.super_class = v2;
  return (_TtC8SearchUI31SearchUISpringAnimationSettings *)objc_msgSendSuper2(&v5, sel_init);
}

- (double)bounce
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  return *v2;
}

- (void)setBounce:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  *v4 = a3;
}

- (double)perceptualDuration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setPerceptualDuration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  *v4 = a3;
}

- (double)delay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
  swift_beginAccess();
  return *v2;
}

- (void)setDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
  swift_beginAccess();
  *v4 = a3;
}

- (CABasicAnimation)coreAnimation
{
  double *v3;
  double v4;
  double *v5;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  v4 = *v3;
  v5 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  return (CABasicAnimation *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2848]), sel_initWithPerceptualDuration_bounce_, v4, *v5);
}

- (UIViewPropertyAnimator)propertyAnimator
{
  double *v3;
  double v4;
  double *v5;
  double v6;
  id v7;
  _TtC8SearchUI31SearchUISpringAnimationSettings *v8;
  id v9;
  id v10;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  v4 = *v3;
  v5 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  v6 = *v5;
  v7 = objc_allocWithZone(MEMORY[0x1E0DC3CA0]);
  v8 = self;
  v9 = objc_msgSend(v7, sel_initWithDuration_bounce_, v4, v6);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F38]), sel_initWithDuration_timingParameters_, v9, 0.0);

  return (UIViewPropertyAnimator *)v10;
}

- (_TtC8SearchUI31SearchUISpringAnimationSettings)init
{
  _TtC8SearchUI31SearchUISpringAnimationSettings *result;

  result = (_TtC8SearchUI31SearchUISpringAnimationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
