@implementation AccessoryContainerView

- (_TtC5TeaUI22AccessoryContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  AccessoryContainerView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI22AccessoryContainerView *v2;

  v2 = self;
  AccessoryContainerView.layoutSubviews()();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  Class isa;
  UIEvent_optional v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.value.super.isa = (Class)self;
  isa = v10.value.super.isa;
  LOBYTE(self) = AccessoryContainerView.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v10);

  return self & 1;
}

- (_TtC5TeaUI22AccessoryContainerView)initWithFrame:(CGRect)a3
{
  AccessoryContainerView.init(frame:)();
}

@end
