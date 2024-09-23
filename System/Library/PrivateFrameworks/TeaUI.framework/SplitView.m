@implementation SplitView

- (_TtC5TeaUI9SplitView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI9SplitView *)SplitView.init(frame:)();
}

- (_TtC5TeaUI9SplitView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B160CC2C();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC5TeaUI9SplitView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  SplitView.draw(_:)(v8);

}

- (void).cxx_destruct
{
  _BYTE v2[176];

  sub_1B160C664((uint64_t)self + OBJC_IVAR____TtC5TeaUI9SplitView_model, (uint64_t)v2);
  sub_1B160C834((uint64_t)v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char))sub_1B13C9B68);
}

@end
