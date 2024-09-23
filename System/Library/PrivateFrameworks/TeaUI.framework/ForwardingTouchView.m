@implementation ForwardingTouchView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_class *v4;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC5TeaUI19ForwardingTouchView *v9;
  UIEvent_optional v11;

  v4 = (objc_class *)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = ForwardingTouchView.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (BOOL)_accessibilityUsesFixFor72070946
{
  return 1;
}

- (_TtC5TeaUI19ForwardingTouchView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI19ForwardingTouchView *)ForwardingTouchView.init(frame:)();
}

- (_TtC5TeaUI19ForwardingTouchView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI19ForwardingTouchView *)ForwardingTouchView.init(coder:)(a3);
}

@end
