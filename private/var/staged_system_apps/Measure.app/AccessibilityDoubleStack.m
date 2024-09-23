@implementation AccessibilityDoubleStack

- (_TtC7Measure24AccessibilityDoubleStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure24AccessibilityDoubleStack *)sub_10004A844(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure24AccessibilityDoubleStack)initWithCoder:(id)a3
{
  return (_TtC7Measure24AccessibilityDoubleStack *)sub_10004A9D0(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24AccessibilityDoubleStack_bottomLabel));
}

@end
