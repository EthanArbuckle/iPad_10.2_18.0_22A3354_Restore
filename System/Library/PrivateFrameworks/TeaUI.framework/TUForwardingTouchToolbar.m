@implementation TUForwardingTouchToolbar

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  TUForwardingTouchToolbar *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = ForwardingTouchToolbar.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (TUForwardingTouchToolbar)initWithFrame:(CGRect)a3
{
  return (TUForwardingTouchToolbar *)ForwardingTouchToolbar.init(frame:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  TUForwardingTouchToolbar *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  ForwardingTouchToolbar.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_class *v4;
  CGFloat y;
  CGFloat x;
  id v8;
  TUForwardingTouchToolbar *v9;
  UIEvent_optional v11;

  v4 = (objc_class *)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = ForwardingTouchToolbar.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (int64_t)accessibilityContainerType
{
  TUForwardingTouchToolbar *v2;
  int64_t v3;

  v2 = self;
  v3 = ForwardingTouchToolbar.accessibilityContainerType.getter();

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  TUForwardingTouchToolbar *v2;
  char v3;

  v2 = self;
  v3 = ForwardingTouchToolbar.accessibilityElementsHidden.getter();

  return v3 & 1;
}

- (TUForwardingTouchToolbar)initWithCoder:(id)a3
{
  return (TUForwardingTouchToolbar *)ForwardingTouchToolbar.init(coder:)((uint64_t)a3);
}

@end
