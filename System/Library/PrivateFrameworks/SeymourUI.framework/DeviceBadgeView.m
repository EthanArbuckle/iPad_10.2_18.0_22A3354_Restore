@implementation DeviceBadgeView

- (_TtC9SeymourUI15DeviceBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B9E6F14();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI15DeviceBadgeView *v2;

  v2 = self;
  sub_22B9E6210();

}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI15DeviceBadgeView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_22B9E6740();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC9SeymourUI15DeviceBadgeView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI15DeviceBadgeView *result;

  result = (_TtC9SeymourUI15DeviceBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15DeviceBadgeView_heightConstraint));
}

@end
