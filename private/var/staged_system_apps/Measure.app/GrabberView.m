@implementation GrabberView

- (_TtC7Measure11GrabberView)init
{
  return (_TtC7Measure11GrabberView *)sub_1001B6FA4();
}

- (_TtC7Measure11GrabberView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7Measure11GrabberView *result;

  v5 = OBJC_IVAR____TtC7Measure11GrabberView_backgroundView;
  v6 = objc_allocWithZone((Class)_UIGrabber);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC7Measure11GrabberView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/GrabberView.swift", 25, 2, 20, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC7Measure11GrabberView *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  v2 = qword_10047A750;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10047A750, sub_10000EF04);
  v4 = qword_1004AF088;
  if (qword_10047A788 != -1)
    swift_once(&qword_10047A788, sub_10000EF7C);
  v5 = qword_1004AF0C0;

  v6 = *(double *)&v4;
  v7 = *(double *)&v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC7Measure11GrabberView)initWithFrame:(CGRect)a3
{
  _TtC7Measure11GrabberView *result;

  result = (_TtC7Measure11GrabberView *)_swift_stdlib_reportUnimplementedInitializer("Measure.GrabberView", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
