@implementation AccessibilityTripleStack

- (_TtC7Measure24AccessibilityTripleStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure24AccessibilityTripleStack *)sub_100125F58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure24AccessibilityTripleStack)initWithCoder:(id)a3
{
  return (_TtC7Measure24AccessibilityTripleStack *)sub_10012613C(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24AccessibilityTripleStack_middleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24AccessibilityTripleStack_bottomLabel));
}

@end
