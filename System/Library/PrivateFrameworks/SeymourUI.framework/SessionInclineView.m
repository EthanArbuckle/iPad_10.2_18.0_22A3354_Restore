@implementation SessionInclineView

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI18SessionInclineView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B5C22EC();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI18SessionInclineView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5C32E4();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI18SessionInclineView *v2;

  v2 = self;
  sub_22B5C2D6C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SessionInclineView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI18SessionInclineView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI18SessionInclineView *result;

  result = (_TtC9SeymourUI18SessionInclineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_walkingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_runningImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_walkingValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_runningValueLabel));
}

@end
