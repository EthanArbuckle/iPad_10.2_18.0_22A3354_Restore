@implementation TextBadgeView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI13TextBadgeView_textLabel), sel_firstBaselineAnchor);
}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI13TextBadgeView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B1986A0();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI13TextBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13TextBadgeView *)sub_22B198720(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13TextBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B198BB8();
}

- (void).cxx_destruct
{

}

@end
