@implementation _UIDismissInteractionSubInteractionSettings

- (UIViewSpringAnimationBehaviorSettings)updateSpring
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring));
}

- (void)setUpdateSpring:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring) = (Class)a3;
  v3 = a3;

}

- (double)effectiveDistanceFactor
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_effectiveDistanceFactor);
}

- (void)setEffectiveDistanceFactor:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_effectiveDistanceFactor) = a3;
}

- (double)dismissThreshold
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_dismissThreshold);
}

- (void)setDismissThreshold:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_dismissThreshold) = a3;
}

- (double)scaleDismissThreshold
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleDismissThreshold);
}

- (void)setScaleDismissThreshold:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleDismissThreshold) = a3;
}

- (double)hysteresisPadding
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_hysteresisPadding);
}

- (void)setHysteresisPadding:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_hysteresisPadding) = a3;
}

- (double)coneOfInfluenceLeftAngle
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceLeftAngle);
}

- (void)setConeOfInfluenceLeftAngle:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceLeftAngle) = a3;
}

- (double)coneOfInfluenceRightAngle
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceRightAngle);
}

- (void)setConeOfInfluenceRightAngle:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceRightAngle) = a3;
}

- (double)minScale
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_minScale);
}

- (void)setMinScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_minScale) = a3;
}

- (double)scaleStretchinessLowerBound
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessLowerBound);
}

- (void)setScaleStretchinessLowerBound:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessLowerBound) = a3;
}

- (double)scaleStretchinessUpperBound
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessUpperBound);
}

- (void)setScaleStretchinessUpperBound:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessUpperBound) = a3;
}

- (void)setDefaultValues
{
  _TtC5UIKit43_UIDismissInteractionSubInteractionSettings *v2;

  v2 = self;
  sub_18563B92C();

}

+ (id)settingsControllerModule
{
  id v2;

  sub_18563BFCC();
  return v2;
}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)initWithDefaultValues
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)sub_18563BA28();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring));
}

@end
