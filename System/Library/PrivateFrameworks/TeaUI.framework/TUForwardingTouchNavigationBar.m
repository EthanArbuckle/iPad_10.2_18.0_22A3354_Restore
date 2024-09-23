@implementation TUForwardingTouchNavigationBar

- (TUForwardingTouchNavigationBar)initWithFrame:(CGRect)a3
{
  return (TUForwardingTouchNavigationBar *)ForwardingTouchNavigationBar.init(frame:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  TUForwardingTouchNavigationBar *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  ForwardingTouchNavigationBar.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_class *v4;
  CGFloat y;
  CGFloat x;
  id v8;
  TUForwardingTouchNavigationBar *v9;
  UIEvent_optional v11;

  v4 = (objc_class *)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = ForwardingTouchNavigationBar.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (NSArray)accessibilityElements
{
  TUForwardingTouchNavigationBar *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = ForwardingTouchNavigationBar.accessibilityElements.getter();

  if (v3)
  {
    v4 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  uint64_t v4;
  TUForwardingTouchNavigationBar *v5;

  if (a3)
    v4 = sub_1B16B9B54();
  else
    v4 = 0;
  v5 = self;
  ForwardingTouchNavigationBar.accessibilityElements.setter(v4);

}

- (TUForwardingTouchNavigationBar)initWithCoder:(id)a3
{
  return (TUForwardingTouchNavigationBar *)ForwardingTouchNavigationBar.init(coder:)(a3);
}

@end
