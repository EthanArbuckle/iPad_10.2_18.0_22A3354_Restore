@implementation ImplicitAnimationGroup

- (_TtC5TeaUI22ImplicitAnimationGroup)init
{
  ImplicitAnimationGroup.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (int64_t)state
{
  _TtC5TeaUI22ImplicitAnimationGroup *v2;
  int64_t v3;

  v2 = self;
  v3 = ImplicitAnimationGroup.state.getter();

  return v3;
}

- (BOOL)isRunning
{
  _TtC5TeaUI22ImplicitAnimationGroup *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ImplicitAnimationGroup.isRunning.getter();

  return v3 & 1;
}

- (BOOL)isReversed
{
  _TtC5TeaUI22ImplicitAnimationGroup *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ImplicitAnimationGroup.isReversed.getter();

  return v3 & 1;
}

- (void)setReversed:(BOOL)a3
{
  _TtC5TeaUI22ImplicitAnimationGroup *v4;

  v4 = self;
  ImplicitAnimationGroup.isReversed.setter(a3);

}

- (double)fractionComplete
{
  _TtC5TeaUI22ImplicitAnimationGroup *v2;
  double v3;
  double v4;

  v2 = self;
  ImplicitAnimationGroup.fractionComplete.getter();
  v4 = v3;

  return v4;
}

- (void)setFractionComplete:(double)a3
{
  _TtC5TeaUI22ImplicitAnimationGroup *v4;

  v4 = self;
  ImplicitAnimationGroup.fractionComplete.setter(a3);

}

- (void)startAnimation
{
  _TtC5TeaUI22ImplicitAnimationGroup *v2;

  v2 = self;
  ImplicitAnimationGroup.startAnimation()();

}

- (void)startAnimationAfterDelay:(double)a3
{
  _TtC5TeaUI22ImplicitAnimationGroup *v4;

  v4 = self;
  ImplicitAnimationGroup.startAnimation(afterDelay:)(a3);

}

- (void)pauseAnimation
{
  _TtC5TeaUI22ImplicitAnimationGroup *v2;

  v2 = self;
  ImplicitAnimationGroup.pauseAnimation()();

}

- (void)stopAnimation:(BOOL)a3
{
  _TtC5TeaUI22ImplicitAnimationGroup *v4;

  v4 = self;
  ImplicitAnimationGroup.stopAnimation(_:)(a3);

}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  _TtC5TeaUI22ImplicitAnimationGroup *v4;

  v4 = self;
  ImplicitAnimationGroup.finishAnimation(at:)(a3);

}

- (void)addCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC5TeaUI22ImplicitAnimationGroup *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  ImplicitAnimationGroup.addCompletion(_:)((uint64_t)sub_1B1554650, v5);

  swift_release();
}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  _TtC5TeaUI22ImplicitAnimationGroup *v7;

  swift_unknownObjectRetain();
  v7 = self;
  ImplicitAnimationGroup.continueAnimation(withTimingParameters:durationFactor:)((uint64_t)a3, a4);
  swift_unknownObjectRelease();

}

@end
