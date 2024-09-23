@implementation ReticleAnimator

- (CAShapeLayer)reticleShapeLayer
{
  return (CAShapeLayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC7Measure15ReticleAnimator_reticleShapeLayer));
}

- (_TtC7Measure15ReticleAnimator)init
{
  _TtC7Measure15ReticleAnimator *result;

  result = (_TtC7Measure15ReticleAnimator *)_swift_stdlib_reportUnimplementedInitializer("Measure.ReticleAnimator", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15ReticleAnimator__reticlePulseState));
  swift_bridgeObjectRelease(*(_QWORD *)&self->_reticlePulseState[OBJC_IVAR____TtC7Measure15ReticleAnimator_snapAnimationKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_reticlePulseState[OBJC_IVAR____TtC7Measure15ReticleAnimator_unsnapAnimationKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_reticlePulseState[OBJC_IVAR____TtC7Measure15ReticleAnimator_goodStateAnimationKey]);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  _TtC7Measure15ReticleAnimator *v7;

  v6 = a3;
  v7 = self;
  sub_10016E940(v6, a4);

}

@end
