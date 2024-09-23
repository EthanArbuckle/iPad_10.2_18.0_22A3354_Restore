@implementation NewSecondaryLabelStack

- (_TtC7Measure22NewSecondaryLabelStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure22NewSecondaryLabelStack *)sub_1001350FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure22NewSecondaryLabelStack)initWithCoder:(id)a3
{
  return (_TtC7Measure22NewSecondaryLabelStack *)sub_100135284(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure22NewSecondaryLabelStack_bottomLabel));
}

@end
