@implementation SummaryTrainerView

- (_TtC9SeymourUI18SummaryTrainerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI18SummaryTrainerView *result;

  sub_22B54429C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC9SeymourUI18SummaryTrainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5447D8();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 90.0;
  v3 = 90.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI18SummaryTrainerView *v2;

  v2 = self;
  sub_22B5445EC();

}

- (void).cxx_destruct
{

}

@end
