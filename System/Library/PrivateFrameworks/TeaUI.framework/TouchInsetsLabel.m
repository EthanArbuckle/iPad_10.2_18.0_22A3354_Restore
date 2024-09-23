@implementation TouchInsetsLabel

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC5TeaUI16TouchInsetsLabel *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_1B15C8210(x, y);

  return self & 1;
}

- (_TtC5TeaUI16TouchInsetsLabel)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI16TouchInsetsLabel *)TouchInsetsLabel.init(frame:)();
}

- (_TtC5TeaUI16TouchInsetsLabel)initWithCoder:(id)a3
{
  return (_TtC5TeaUI16TouchInsetsLabel *)TouchInsetsLabel.init(coder:)(a3);
}

@end
