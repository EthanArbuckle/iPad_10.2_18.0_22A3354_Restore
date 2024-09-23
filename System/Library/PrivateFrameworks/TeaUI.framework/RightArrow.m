@implementation RightArrow

- (_TtC5TeaUI10RightArrow)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI10RightArrow *)RightArrow.init(frame:)();
}

- (_TtC5TeaUI10RightArrow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  RightArrow.init(coder:)();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC5TeaUI10RightArrow *v7;
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
  RightArrow.draw(_:)(v8);

}

- (void).cxx_destruct
{

}

@end
