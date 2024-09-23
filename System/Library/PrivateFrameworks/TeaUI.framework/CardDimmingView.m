@implementation CardDimmingView

- (_TtC5TeaUI15CardDimmingView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI15CardDimmingView *)sub_1B13A1F64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC5TeaUI15CardDimmingView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1B1689C68((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5TeaUI15CardDimmingView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI15CardDimmingView *)sub_1B1689D4C(a3);
}

@end
