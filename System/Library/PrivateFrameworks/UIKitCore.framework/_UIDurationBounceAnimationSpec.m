@implementation _UIDurationBounceAnimationSpec

- (double)duration
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_duration);
}

- (void)setDuration:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_duration) = a3;
}

- (double)bounce
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_bounce);
}

- (void)setBounce:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_bounce) = a3;
}

- (double)delay
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_delay);
}

- (void)setDelay:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_delay) = a3;
}

- (double)totalDuration
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_delay)
       + *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_duration);
}

+ (id)settingsControllerModule
{
  id v2;

  sub_1855B71A0();
  return v2;
}

- (_TtC5UIKit30_UIDurationBounceAnimationSpec)initWithDefaultValues
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_duration) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_bounce) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIDurationBounceAnimationSpec_delay) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIDurationBounceAnimationSpec();
  return -[PTSettings initWithDefaultValues](&v3, sel_initWithDefaultValues);
}

@end
