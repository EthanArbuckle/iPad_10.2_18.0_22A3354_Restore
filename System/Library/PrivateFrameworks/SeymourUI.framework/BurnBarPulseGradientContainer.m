@implementation BurnBarPulseGradientContainer

- (_TtC9SeymourUI29BurnBarPulseGradientContainer)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI29BurnBarPulseGradientContainer *)sub_22B4F8AE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI29BurnBarPulseGradientContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4F9774();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29BurnBarPulseGradientContainer_gradient));
}

@end
