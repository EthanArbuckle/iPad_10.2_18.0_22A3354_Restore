@implementation PassthroughView

- (_TtC5TeaUI15PassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI15PassthroughView *)PassthroughView.init(frame:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC5TeaUI15PassthroughView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1B1570C48((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5TeaUI15PassthroughView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI15PassthroughView *)PassthroughView.init(coder:)(a3);
}

@end
