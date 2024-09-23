@implementation TouchInsetsButton

- (void)layoutSubviews
{
  _TtC5TeaUI17TouchInsetsButton *v2;

  v2 = self;
  sub_1B13BAE50();

}

- (_TtC5TeaUI17TouchInsetsButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17TouchInsetsButton *)TouchInsetsButton.init(frame:)();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC5TeaUI17TouchInsetsButton *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_1B15547D0(x, y);

  return self & 1;
}

- (_TtC5TeaUI17TouchInsetsButton)initWithCoder:(id)a3
{
  return (_TtC5TeaUI17TouchInsetsButton *)TouchInsetsButton.init(coder:)(a3);
}

@end
