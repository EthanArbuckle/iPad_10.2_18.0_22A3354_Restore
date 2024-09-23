@implementation InteractiveLabel

- (_TtC7Measure16InteractiveLabel)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  return (_TtC7Measure16InteractiveLabel *)sub_1000750F4(a4, x, y, width, height);
}

- (_TtC7Measure16InteractiveLabel)initWithCoder:(id)a3
{
  return (_TtC7Measure16InteractiveLabel *)sub_1000753E0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure16InteractiveLabel_cancellableSubs));
  sub_100026F30((uint64_t)self + OBJC_IVAR____TtC7Measure16InteractiveLabel_configuration);
  swift_release();
}

@end
