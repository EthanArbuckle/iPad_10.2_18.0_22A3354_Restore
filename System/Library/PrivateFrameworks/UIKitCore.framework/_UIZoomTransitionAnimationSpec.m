@implementation _UIZoomTransitionAnimationSpec

- (UIViewSpringAnimationBehaviorSettings)morph
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_morph));
}

- (void)setMorph:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_morph);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_morph) = (Class)a3;
  v3 = a3;

}

- (UIViewSpringAnimationBehaviorSettings)transform
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_transform));
}

- (void)setTransform:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_transform);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_transform) = (Class)a3;
  v3 = a3;

}

- (UIViewSpringAnimationBehaviorSettings)position
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_position));
}

- (void)setPosition:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_position);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_position) = (Class)a3;
  v3 = a3;

}

- (UIViewSpringAnimationBehaviorSettings)general
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_general));
}

- (void)setGeneral:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_general);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_general) = (Class)a3;
  v3 = a3;

}

- (UIViewSpringAnimationBehaviorSettings)cornerRadiusAdjustment
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment));
}

- (void)setCornerRadiusAdjustment:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment) = (Class)a3;
  v3 = a3;

}

- (void)setDefaultValues
{
  _TtC5UIKit30_UIZoomTransitionAnimationSpec *v2;

  v2 = self;
  sub_1856B0B78();

}

+ (id)settingsControllerModule
{
  id v2;

  sub_1856B1998();
  return v2;
}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)initWithDefaultValues
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)sub_1856B0D80();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment));
}

@end
